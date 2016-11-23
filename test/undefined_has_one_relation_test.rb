require 'test_helper'
require 'fixtures/blog'

class UndefinedRelationTest < Minitest::Test
  def test_undefined_has_one_relation
    assert_raises(MotionJsonApi::UndefinedHasOneRelation) do
      resource = MotionJsonApi.parse(blog)
      resource.reference
    end
  end
end
