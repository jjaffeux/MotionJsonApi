require 'test_helper'
require 'fixtures/user'
require 'fixtures/activity'

class SingleResourceTest < Minitest::Test
  def setup
    @subject = MotionJsonApi.parse(user)
  end
  
  def test_attribute
    assert_equal(@subject.name, "joffrey")
  end

  def test_id
    assert_equal(@subject.id, "36ffe4bf-85d6-45d2-8c41-7998c34cafcd")
  end

  def test_has_many_key
    assert_equal(@subject.bestof.first.class, ServiceResource)
  end

  def test_has_one_key
    assert_equal(@subject.favorites.first.recent.class, ContributionResource)
  end

  def test_attribute_key
    assert_equal(@subject.username, "xjoffrey")
  end

  def test_has_many
    assert_equal(1, @subject.favorites.count)

    favorite = @subject.favorites.first
    assert_equal(ServiceResource, favorite.class)
    assert_equal("Le Kiez", favorite.title)
  end

  def test_relationship_has_one
    contribution = @subject.favorites.first.recent_contribution
    assert_equal(ContributionResource, contribution.class)
    assert_equal(8, contribution.wait)
  end

  def test_relationship_of_relationship_has_one
    author = @subject.favorites.first.recent_contribution.author
    assert_equal("44c9905d-5faa-4755-9851-9b8ff5d38fda", author.id)
    assert_equal("marc", author.name)
  end

  def test_meta
    assert_equal({"total-pages"=>2}, @subject.meta)
  end

  def test_links
    assert_equal({"self"=>"/users?page[number]=3&page[size]=1"}, @subject.links)
  end

  def test_links
    res = MotionJsonApi.parse(activity)
    assert_equal({"self"=>"/activities/ce84420e-b93c-4800-ace9-d4c9a8c39250"}, res.links)
  end

  def test_relationship_links
    author = @subject.favorites.first.recent_contribution.author
    assert_equal({"self"=>"/users/44c9905d-5faa-4755-9851-9b8ff5d38fda"}, author.links)
  end

  def test_relationship_meta
    meta = @subject.favorites.first.meta
    assert_equal({"some_count" => 1}, meta)
  end
end
