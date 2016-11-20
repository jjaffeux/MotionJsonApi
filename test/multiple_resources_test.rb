require 'test_helper'
require 'fixtures/users'

class MultipleResourcesTest < Minitest::Test
  def setup
    @subject = MotionJsonApi.parse(users)
  end

  def test_attribute
    assert_equal(@subject.first.name, "joffrey")
  end

  def test_id
    assert_equal(@subject.first.id, "36ffe4bf-85d6-45d2-8c41-7998c34cafcd")
  end

  def test_included_top_level_data
    author = @subject.first.favorites.first.recent_contribution.author
    assert_equal(author.class, UserResource)
    assert_equal(author.id, "36ffe4bf-85d6-45d2-8c41-7998c34cafcd")
  end
end
