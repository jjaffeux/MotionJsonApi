require 'test_helper'
require 'fixtures/blog'

class UndefinedRelationTest < Minitest::Test
  def test_undefined_has_many_relation
    assert_raises(MotionJsonApi::UndefinedHasManyRelation) do
      resource = MotionJsonApi.parse(blog)
      resource.blobs
    end
  end
end
