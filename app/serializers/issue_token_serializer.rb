class IssueTokenSerializer
  include FastJsonapiCandy::Serializer

  build_belongs_to :issue
  build_has_many :observations

  attributes :token, :valid_until

  attribute :expired do |object|
    !object.valid_token?
  end

  attribute :approved do |object|
    object.issue.approved?
  end
end
