# frozen_string_literal: true

class Player < User
  def initialize
    super
    reveal_cards
  end
end
