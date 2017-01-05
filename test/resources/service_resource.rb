class ServiceResource < MotionJsonApi::Resource
  resource_type :services

  attribute :title

  has_one :recent_contribution
  has_one :xrecent_contribution, key: "recent"

  has_many :urls
end
