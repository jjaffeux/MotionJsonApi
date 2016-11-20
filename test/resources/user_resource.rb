class UserResource < MotionJsonApi::Resource
  resource_type :users

  attribute :name
  attribute :xname, key: "username"

  has_many :favorites
  has_many :xfavorites, key: "bestof"
end
