require 'rails_helper'

RSpec.describe FundWithdrawal do
  it_behaves_like 'person_scopable',
    create: -> (person_id) { create(:full_fund_withdrawal, person_id: person_id) },
    change_person: -> (obj, person_id){ obj.person_id = person_id }

  let(:person) { create(:empty_person) }

  it 'validates non null fields' do
    invalid = FundWithdrawal.new
    expect(invalid).not_to be_valid
    expect(invalid.errors.keys).to match_array(%i[
      country currency external_id person amount exchange_rate_adjusted_amount withdrawal_date
    ])
  end

  it 'is valid with a person, currency and withdrawal_date' do
    expect(create(:fund_withdrawal, person: person)).to be_valid
  end

  it 'logs creation of fund withdrawals' do
    object = create(:full_fund_withdrawal, person: person)
    assert_logging(object, :create_entity, 1)
  end

  it 'is not valid if withdrawal_date is in the future' do
    object = build(:fund_withdrawal, person: person, withdrawal_date: 1.hour.from_now)
    expect(object).to_not be_valid
    expect(object.errors.messages.keys.first).to eq(:withdrawal_date)
  end

  it 'is not valid if withdrawal_date is nil' do
    object = build(:fund_withdrawal, person: person, withdrawal_date: nil)
    expect(object).to_not be_valid
    expect(object.errors.messages.keys.first).to eq(:withdrawal_date)
  end

  it 'creates person country tags if needed, and applies them only if needed' do
    bob = create(:empty_person)

    expect { create(:full_fund_withdrawal, person: bob) }
      .to change { Tag.count }.by(1)

    tag = Tag.last
    expect(tag.name).to eq 'active-in-AR'
    expect(bob.tags.first).to eq(tag)

    alice = create(:empty_person)
    expect { create(:full_fund_withdrawal, person: alice) }
      .not_to change { Tag.count }

    expect(alice.tags.first).to eq(tag)

    expect { create(:full_fund_withdrawal, person: alice) }
      .not_to change{ alice.tags }
  end

  it 'creates person country tags if needed, and applies them only if needed for AN' do
    bob = create(:empty_person)

    expect { create(:an_fund_withdrawal, person: bob) }
      .to change { Tag.count }.by(1)

    tag = Tag.last
    expect(tag.name).to eq 'active-in-AN'
    expect(bob.tags.first).to eq(tag)

    alice = create(:empty_person)
    expect { create(:an_fund_withdrawal, person: alice) }
      .not_to change { Tag.count }

    expect(alice.tags.first).to eq(tag)

    expect { create(:an_fund_withdrawal, person: alice) }
      .not_to change{ alice.tags }
  end

  it 'filter withdrawals by fiat currencies when user admin is auditor' do
    admin_user = create(:admin_user)
    AdminUser.current_admin_user = admin_user 
    Settings.fiat_only['audit_emails'] = [ admin_user.email ]
    new_person = create(:empty_person)
    create(:full_fund_withdrawal, person: new_person, currency: Currency.find_by_code('ars'))
    create(:full_fund_withdrawal, person: new_person, currency: Currency.find_by_code('usd'))
    create(:full_fund_withdrawal, person: new_person, currency: Currency.find_by_code('btc'))
    create(:full_fund_withdrawal, person: new_person, currency: Currency.find_by_code('ada'))
    fund_withdrawal = new_person.fund_withdrawals
    expect(fund_withdrawal.count).to eq 2
    fund_withdrawal.each { |d| expect(d.currency.is_fiat?).to eq true}
  end
end
