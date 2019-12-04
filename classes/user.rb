# frozen_string_literal: true

class User
  attr_accessor :cards, :name, :hand
  attr_reader :balance

  def initialize
    @cards = []
    @balance = Bank.new
    @hand = Hand.new(@cards)
    @hide_cards = true
  end

  def receive_card(card)
    @cards << card
  end

  def hidden_cards?
    @hide_cards
  end

  def hide_cards
    @hide_cards = true
  end

  def reveal_cards
    @hide_cards = false
  end

  def reset_cards
    @cards = []
    @hand = Hand.new(@cards)
  end
end
