# frozen_string_literal: true

module Cereals
  class Serializer
    def initialize(object)
      @object = object
    end

    # see lib/active_support/core_ext/object/json.rb
    # for the definitions of #to_json and #as_json added by ActiveSupport

    # super is ActiveSupport::ToJsonWithActiveSupportEncoder
    def to_json(root: true)
      super(root: root)
    end

    # override ActiveSupport's #as_json
    def as_json(root: true)
      if root
        { root_name => to_hash }
      else
        to_hash
      end
    end

    private

    def root_name
      @object.class.name.underscore
    end
  end
end
