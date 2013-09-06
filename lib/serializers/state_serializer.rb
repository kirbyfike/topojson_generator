class StateSerializer < ActiveModel::Serializer
  attr_accessor :state_key
  def initialize(object, state_key="state_code", options = {root: false})
    super(object, options)
    @state_key = state_key
  end

  def states
    object.inject({}) do |all_states, state|
      all_states[state[@state_key].to_sym] = state.attributes
      all_states.with_indifferent_access
    end
  end
end
