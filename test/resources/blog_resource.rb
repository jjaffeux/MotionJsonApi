class BlogResource < MotionJsonApi::Resource
  resource_type :blogs

  has_one :reference
  has_many :blobs
end
