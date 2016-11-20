# MotionJsonApi

A small library that helps you transform JSONApi server responses into objects.

Note: this gem is not intended to create valid JSON Api payload to send to a server.
If you have this need, feel free to contribute.

## Installation

Add this line to your Gemfile:

```
gem 'motion-json-api'
```

## Usage

```ruby

# Define resources
class User < MotionJsonApi::Resource
  resource_type :users

  attribute :name
  attribute :profile_name, key: :username

  has_one :blog
end

class Blog < MotionJsonApi::Resource
  resource_type :blogs

  attribute :title
  has_many :articles
end

class Article < MotionJsonApi::Resource
  resource_type :articles

  attribute :title
  attribute :body

  has_one :user
end

resource = MotionJsonApi.parse(server_response)

resource.user
resource.user.name
resource.user.username
resource.user.blog
resource.user.blog.title
resource.user.blog.articles
resource.user.blog.articles.first.author

resource.links
resource.meta

resource.user.links
```

## Run tests

```
bundle install
rake test
```
