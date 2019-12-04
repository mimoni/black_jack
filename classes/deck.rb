# frozen_string_literal: true

class Deck
  def initialize
    @cards = %w[♠ ♥ ♣ ♦].flat_map do |suit|
      %w[2 3 4 5 6 7 8 9 10 В Д К Т].map do |value|
        Card.new(suit, value)
      end
    end

    @cards.shuffle!
  end

  def size
    @cards.size
  end

  def take_card
    @cards.pop
  end
end
