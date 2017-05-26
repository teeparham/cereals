# frozen_string_literal: true

require "test_helper"

class CerealsTest < Minitest::Spec
  it "sets version" do
    refute_nil Cereals::VERSION
  end
end
