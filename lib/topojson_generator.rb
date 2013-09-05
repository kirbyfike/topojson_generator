module TopojsonGeneratorParams
  attr_accessor :state_code

  def topojson_with_state_key(state_key = :state_code)
    @state_code = state_key
    puts "hhhhhhhhhhhhhhhhhhhh"
  end

  
end

class TopojsonGenerator
  extend TopojsonGeneratorParams
  def topojson_generator(model_object)
    puts "zzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
  end
end

## Example
#module Delinquency
#  class DeliquenciesController < ApplicationController
#    extend TopojsonGeneratorParams
#    topojson_with_state_key :state_code
#
#    def index
#      TopojsonGenerator.topojson_generator(5);
#      respond_with(topojson_generator(StateState.all))
#    end
#  end
#end
