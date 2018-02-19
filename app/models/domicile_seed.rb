class DomicileSeed < ApplicationRecord
  belongs_to :issue
  belongs_to :domicile, optional: true
  has_many :attachments, as: :seed_to

  accepts_nested_attributes_for :attachments, :allow_destroy => true
end
