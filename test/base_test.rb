# frozen_string_literal: true

require "test_helper"

class BaseTest < Minitest::Spec
  class Thing
    include Cereals::Base
  end

  class ThingSerializer
    def initialize(_)
    end

    def to_json
      "{}"
    end
  end

  it "#serializer_class" do
    assert_equal ThingSerializer, Thing.new.serializer_class
  end

  it "#serializer" do
    assert_kind_of ThingSerializer, Thing.new.serializer
  end

  it "delegates to serializer" do
    assert_equal "{}", Thing.new.to_json
  end
end
