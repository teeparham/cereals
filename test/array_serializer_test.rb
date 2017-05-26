require "test_helper"

class ArraySerializerTest < Minitest::Spec
  let(:doge) { Doge.new }

  it "serializes" do
    array_serializer = Cereals::ArraySerializer.new([doge], "doges")
    assert_equal %({"doges":[#{json(doge)}]}), array_serializer.to_json
  end

  it "parses JSON" do
    assert_kind_of Hash, JSON.parse(Cereals::ArraySerializer.new([doge], "doges").to_json)
  end
end
