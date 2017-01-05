require 'test_helper'
require 'fixtures/user'

class UndefinedRelationTest < Minitest::Test
  def test_non_included_resource
    resource = MotionJsonApi.parse(user)
    service = resource.favorites.first
    assert_equal([{"id" => "d09c59b1-b8fe-46a3-94b6-3ad9e9186fd3", "type" => "urls"}], service.urls)

    resource = MotionJsonApi.parse(user)
    assert_equal({"id" => "4e6774fc-1b7b-4896-8b3c-5b577e1ed24b", "type" => "friends"}, resource.friend)
  end
end
