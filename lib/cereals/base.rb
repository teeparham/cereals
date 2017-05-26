# frozen_string_literal: true

module Cereals
  module Base
    def self.included(base)
      base.delegate :to_json, to: :serializer
    end

    def serializer_class
      Object.const_get("#{self.class.name}Serializer")
    end

    def serializer
      serializer_class.new(self)
    end
  end
end
