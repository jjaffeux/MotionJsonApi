require 'test_helper'
require 'fixtures/blog'

class UndefinedRelationTest < Minitest::Test
  def test_undefined_has_many_relation
    resource = MotionJsonApi.parse(blog)
    assert_equal([], resource.blobs)
  end
end
