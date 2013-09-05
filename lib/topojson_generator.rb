module TopojsonGenerator
  attr_accessor :state_code

  def topojson_with_state_key(state_key = :state_code)
    @state_code = state_key
  end

  def topojson_generator(model_object)
  
  end
end





## Example
module Delinquency
  class DeliquenciesController < ApplicationController
    extend TopojsonGenerator
    topojson_with_state_key :state_code

    def index
      respond_with(topojson_generator(StateState.all))
    end
  end
end
