# frozen_string_literal: true

module Cereals
  class ArraySerializer
    # objects must respond to :serializer
    # root is a string, the name of the root JSON key
    def initialize(objects, root)
      @objects = objects
      @root = root
    end

    # accept arguments to work with rails rendering
    def to_json(_ = nil)
      { @root => wrap_objects.as_json(root: false) }.to_json
    end

    private

    def wrap_objects
      @objects.map(&:serializer)
    end
  end
end
