require "minitest/autorun"
require "cereals"

begin
  require "pry-byebug"
rescue LoadError
  # no sweat
end

module Minitest
  class Spec
    private

    def json(doge)
      "{" +
        %("id":#{doge.id},) +
        %("name":"#{doge.name}",) +
        %("such":"#{doge.such}") +
        "}"
    end
  end
end

class Doge
  include Cereals::Base

  def id
    123
  end

  def name
    "Snoop"
  end

  def such
    "very"
  end
end

class DogeSerializer < Cereals::Serializer
  def to_hash
    {
      id: @object.id,
      name: @object.name,
      such: @object.such
    }
  end
end
