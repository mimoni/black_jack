# frozen_string_literal: true

require_relative 'deck'

class Card
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

    case value
    when 'Т' then 11
    when 'В', 'Д', 'К' then 10
    end
  end
end
