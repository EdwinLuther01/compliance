class NaturalDocket < ApplicationRecord
  belongs_to :issue, optional: true
  belongs_to :person

  has_many :natural_docket_seeds
  has_many :attachments, as: :seed_to

  scope :current, ->(person) { where(person: person, replaced_by_id: nil) }
end
