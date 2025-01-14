FactoryBot.define do
  factory :empty_person, class: Person do

    trait :with_issue do
      after(:create) do |person, evaluator|
        create :basic_issue, person: person
      end
    end
  end

  factory :new_natural_person, class: Person do
    risk { nil }

    after(:create) do |person, evaluator|
      create :full_natural_person_issue, person: person
    end

    trait :with_fixed_email do
      after(:create) do |person, evaluator|
        create :full_natural_person_issue_with_fixed_email, person: person
      end
    end

    trait :with_new_client_reason do
      after(:create) do |person, evaluator|
        create :full_natural_person_issue_with_new_client_reason, person: person
      end
    end
  end

  factory :light_natural_person, class: Person do
    risk { :medium }
    after(:create) do |person, evaluator|
      person.enable!
      create :basic_issue, person: person, aasm_state: 'approved'
      %i(
        full_natural_person_identification
        full_natural_docket
        full_email
      ).each do |name|
        create name, person: person
      end
    end
  end

  factory :full_natural_person, class: Person do
    risk { :medium }

    transient do
      country { nil }
      include_affinity { true }
    end

    after(:create) do |person, evaluator|
      person.enable!
      # A full natural person should have at least the issue that created it.
      # Here we start with a basic issue for this person, then the full
      # factories inject their seeds into the basic_issue in their after :create
      create :basic_issue, person: person, aasm_state: 'approved'
      %i(
        full_domicile
        full_risk_score
        full_natural_person_identification
        full_natural_docket
        full_argentina_invoicing_detail
        full_phone
        full_email
        full_note
        salary_allowance
        savings_allowance
      ).each do |name|
        create name, person: person
      end

      attrs = { person: person }
      attrs[:country] = evaluator.country if evaluator.country.present?

      create :full_fund_deposit, **attrs
      create :full_fund_withdrawal, **attrs
      create :full_affinity, person: person if evaluator.include_affinity
    end

    trait :with_fixed_email do
      after(:create) do |person, evaluator|
        create :basic_issue, person: person, aasm_state: 'approved'
        %i(
          full_domicile
          full_risk_score
          full_natural_person_identification
          full_natural_docket
          full_argentina_invoicing_detail
          full_phone
          fixed_full_email
          full_note
          full_affinity
          full_fund_deposit
          full_fund_withdrawal
          salary_allowance
          savings_allowance
        ).each do |name|
          create name, person: person
        end
      end
    end

    trait :with_tags do
      after(:create) do |person, evaluator|
        create :full_person_tagging, person: person
      end
    end
  end

  factory :full_legal_entity_person, class: Person do
    risk { :medium }

    transient do
      country { nil }
      include_affinity { true }
    end

    after(:create) do |person, evaluator|
      person.enable!
      # A full natural person should have at least the issue that created it.
      # Here we start with a basic issue for this person, then the full
      # factories inject their seeds into the basic_issue in their after :create
      create :basic_issue, person: person, aasm_state: 'approved'
      %i(
        full_domicile
        full_risk_score
        full_legal_entity_identification
        full_legal_entity_docket
        company_full_argentina_invoicing_detail
        full_phone
        full_email
        full_note
        heavy_allowance
      ).each do |name|
        create name, person: person
      end

      attrs = { person: person }
      attrs[:country] = evaluator.country if evaluator.country.present?
      create :full_fund_deposit, **attrs
      create :full_fund_withdrawal, **attrs
      create :full_affinity, person: person if evaluator.include_affinity
    end
  end

  factory :another_person, class: Person do
  end
end
