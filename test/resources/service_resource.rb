class ServiceResource < MotionJsonApi::Resource
  resource_type :services

  attribute :title

  has_one :recent_contribution
end
