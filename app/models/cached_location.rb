class CachedLocation
  include Mongoid::Document
  field :address, type: String
  field :lng, type: Float
  field :lat, type: Float
  field :location, type: Hash
end
