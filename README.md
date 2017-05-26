# Cereals

[![Gem Version](https://badge.fury.io/rb/cereals.svg)][gem]
[![Build Status](https://travis-ci.org/teeparham/cereals.svg?branch=master)][build]

[gem]: http://rubygems.org/gems/cereals
[build]: https://travis-ci.org/teeparham/cereals

Cereals makes it easy to serialize ruby objects to JSON.
Cereals provides serializer classes for single objects and collections.

Cereals depends on ActiveSupport's `#to_json` and `#to_hash` implementations.

## Install

Add the gem to your Gemfile:

```ruby
gem "cereals"
```

## Usage

Include the `Cereals::Base` module in the classes you want to serialize.
If you're using Rails 5+, add it to `ApplicationRecord` like so:

```ruby
class ApplicationRecord
  include Cereals::Base
end
```

Create serializer classes with names corresponding to your models.
Implement `#to_hash` on each serializer.

```ruby
class UserSerializer < Cereals::Serializer
  def to_hash
    {
      first_name: @object.first_name,
      last_name: @object.last_name
    }
end
```

A JSON API might look like this:

```ruby
class UsersController
  def show
    user = User.find(params[:id])
    render json: user.to_json
  end

  def index
    users = User.all
    render json: ArraySerializer.new(users, "users").to_json
  end
end
```

## JSON Format

Single objects have a root node.

`UserSerializer.new(user).to_json`

```
{
  "user": {
    "first_name":"Bart",
    "last_name":"Simpson"
  }
}
```

Arrays have a root node, and items within the array do not.

`ArraySerializer.new([user1, user2]).to_json`

```
{
  "users": [
    {
      "first_name":"Bart",
      "last_name":"Simpson"
    },
    {
      "first_name":"Lisa",
      "last_name":"Simpson"
    }    
  ]
}
```

## Configuration

Specify a different serializer class for a model:

```ruby
class User
  def serializer_class
    PersonSerializer
  end
end
```

Specify a different root name for a serializer:

```ruby
class UserSerializer
  private

  def root_name
    "person"
  end
end
```


## Development

After checking out the repo, run `bin/setup` to install dependencies.
Run `rake test` to run the tests. You can also run `bin/console` for an
interactive REPL.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/teeparham/cereals.

This project is intended to be a safe, welcoming space for collaboration,
and contributors are expected to adhere to the
[Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Cereals project’s codebases, issue trackers, chat rooms and
mailing lists is expected to follow the
[code of conduct](https://github.com/teeparham/cereals/blob/master/CODE_OF_CONDUCT.md).
