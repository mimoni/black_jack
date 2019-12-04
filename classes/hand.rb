# frozen_string_literal: true

class Hand
  def initialize(cards)
    @cards = cards
  end

  def points
    points_sum = @cards.sum(&:points)
    if points_sum > 21
      @cards.sum(&:alter_points)
    else
      points_sum
    end
  end

  def busted?
    points > 21
  end
end
