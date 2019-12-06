# frozen_string_literal: true

class Deck
  def initialize
    @cards = []
    generate_cards
  end

  def generate_cards
    Card::SUITS.each do |suit|
      Card::CARDS.each do |value|
        @cards << Card.new(suit, value)
      end
    end

    @cards.shuffle!
    pp @cards
  end

  def size
    @cards.size
  end

  def take_card
    @cards.pop
  end
end
