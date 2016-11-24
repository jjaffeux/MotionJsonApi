require 'test_helper'
require 'fixtures/blog'

class UndefinedRelationTest < Minitest::Test
  def test_undefined_has_one_relation
    resource = MotionJsonApi.parse(blog)
    assert_equal(nil, resource.reference)
  end
end
