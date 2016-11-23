module MotionJsonApi
  class UndefinedResource < StandardError; end
  class UndefinedAttribute < StandardError; end
  class UndefinedHasOneRelation < StandardError; end
  class UndefinedHasManyRelation < StandardError; end
end
