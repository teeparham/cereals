require "test_helper"

class SerializerTest < Minitest::Spec
  let(:doge) { Doge.new }
  let(:serializer) { DogeSerializer.new(doge) }

  it "serializes" do
    assert_equal %({"doge":#{json(doge)}}), serializer.to_json
  end

  it "parses" do
    assert_kind_of Hash, JSON.parse(serializer.to_json)
  end
end
