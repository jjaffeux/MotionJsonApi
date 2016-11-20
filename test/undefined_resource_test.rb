require 'test_helper'
require 'fixtures/undefined'

class UndefinedResourceTest < Minitest::Test
  def test_undefined_resource
    assert_raises(MotionJsonApi::UndefinedResource) do
      MotionJsonApi.parse(undefined)
    end
  end
end
