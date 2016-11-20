class ContributionResource < MotionJsonApi::Resource
  resource_type :contributions

  attribute :wait

  has_one :author
end
