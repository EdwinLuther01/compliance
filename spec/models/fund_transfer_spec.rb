require 'rails_helper'

describe FundTransfer do
  it_behaves_like 'person_scopable',
    create: -> (person_id) {
      create(:fund_transfer,
        source_person_id: person_id,
        target_person: create(:full_person_tagging, tag: create(:some_person_tag)).person
      )
    },
    change_person: -> (obj, person_id){ obj.source_person_id = person_id }

  let(:source_person) { create(:empty_person) }
  let(:target_person) { create(:empty_person) }

  it 'validates non null fields' do
    invalid = FundTransfer.new
    expect(invalid).not_to be_valid
    expect(invalid.errors.keys).to match_array(%i[
      currency source_person target_person amount
      exchange_rate_adjusted_amount external_id transfer_date
    ])
  end

  it 'is valid with a person, currency and transfer_date' do
    expect(create(:fund_transfer,
                  source_person: source_person,
                  target_person: target_person)
                 ).to be_valid
  end

  it 'logs creation of fund transfers' do
    object = create(:full_fund_transfer,
                    source_person: source_person,
                    target_person: target_person
                   )
    assert_logging(object, :create_entity, 1)
  end

  it 'filter transfers by fiat currencies when user admin is auditor' do
    admin_user = create(:admin_user)
    AdminUser.current_admin_user = admin_user 
    Settings.fiat_only['audit_emails'] = [ admin_user.email ]

    create(:fund_transfer, source_person: source_person, target_person: target_person, currency: Currency.find_by_code('ars'))
    create(:fund_transfer, source_person: source_person, target_person: target_person, currency: Currency.find_by_code('usd'))
    create(:fund_transfer, source_person: source_person, target_person: target_person, currency: Currency.find_by_code('btc'))
    create(:fund_transfer, source_person: source_person, target_person: target_person, currency: Currency.find_by_code('ada'))

    sent_transfers = source_person.sent_transfers
    expect(sent_transfers.count).to eq 2
    sent_transfers.each { |d| expect(d.currency.is_fiat?).to eq true }

    received_transfers = target_person.received_transfers
    expect(received_transfers.count).to eq 2
    sent_transfers.each { |d| expect(d.currency.is_fiat?).to eq true }    
  end
end
