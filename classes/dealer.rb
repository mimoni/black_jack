# frozen_string_literal: true

class Dealer < User
  def initialize
    @name = 'Dealer'
    super
  end

  def choice_action
    if @hand.points <= 16
      'a' # add card
    else
      'n' # skip
    end
  end
end
