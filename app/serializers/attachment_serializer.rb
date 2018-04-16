class AttachmentSerializer
  include FastJsonapiCandy::Serializer
  set_type 'attachments'
  attributes :document_file_name, :document_content_type, 
    :document_file_size

  %i(
    created_at
    updated_at
    document_updated_at
  ).each do |attr|
    attribute attr do |obj|
      obj.send(attr).to_i
    end
  end

  build_belongs_to :person
  build_belongs_to :attached_to_fruit
  build_belongs_to :attached_to_seed
end

