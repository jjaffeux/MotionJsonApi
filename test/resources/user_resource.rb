class UserResource < MotionJsonApi::Resource
  resource_type :users

  attribute :name

  has_many :favorites
end
