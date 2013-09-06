require "serializers/state_serializer"

module TopojsonGenerator
  extend ActiveSupport::Concern

  module InstanceMethods
    class TopoJson
      attr_accessor :topodata
      def initialize
        @topodata = load_topojson  
        init_meta_data
      end

      def merge_model_object(state_object={}, filter_array=[], current_as_of="")
        merge_state_data(state_object)
        merge_current_as_of(current_as_of)
        merge_filters(filter_array)
      end

      private
      def load_topojson
        gem_root = Gem::Specification.find_by_name("topojson_generator").gem_dir
        YAML.load_file(gem_root + "/config/us_topo_json.yml").dup
      end

      def init_meta_data
        @topodata["objects"]["us_states"]["meta_data"] = {}
      end

      def merge_state_data(state_object)
        @topodata["objects"]["us_states"]["geometries"].each do |state|
          state["properties"] = state_object[state["properties"]["state_code"]]
        end
      end

      def merge_current_as_of(current_as_of)
        @topodata["objects"]["us_states"]["meta_data"]["current_as_of"] = current_as_of
      end

      def merge_filters(filter_array)
        @topodata["objects"]["us_states"]["meta_data"]["filters"] = filter_array
      end
    end

    def topojson_generator(state_object, state_key="state_code")
      if !state_object.kind_of?(Hash)
        state_object = StateSerializer.new(state_object).states
      end

      topojson = TopoJson.new
      topojson.merge_model_object(state_object)
      topojson.topodata
    end
  end
end
