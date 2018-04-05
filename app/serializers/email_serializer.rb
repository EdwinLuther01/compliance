class EmailSerializer
  include FastJsonapiCandy::Fruit
  attributes :address, :kind
  build_timestamps
  derive_seed_serializer!
end
