# frozen_string_literal: true

class Card
  SUITS = %w[♠ ♣ ♥ ♦].freeze
  CARDS = %w[2 3 4 5 6 7 8 9 10 В Д К Т].freeze

  attr_reader :value, :points

  def initialize(suit, value)
    @suit = suit
    @value = value
    @points = calculate_points(value)
  end

  def alter_points
    ace? ? 1 : @points
  end

  def ace?
    @value == 'Т'
  end

  def to_s
    "#{@value}#{@suit}"
  end

  private

  def calculate_points(value)
    return value.to_i unless value.to_i.zero?

    ace? ? 11 : 10
  end
end
