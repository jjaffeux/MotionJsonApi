require 'test_helper'
require 'fixtures/blog'

class UndefinedAttributeTest < Minitest::Test
  def test_undefined_attribute
    resource = MotionJsonApi.parse(blog)
    assert_equal(nil, resource.something)
  end
end
