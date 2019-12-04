# frozen_string_literal: true

class Game
  BET_SIZING = 10

  def initialize
    @deck = Deck.new
    @dealer = Dealer.new
    @player = Player.new
    @players = [@player, @dealer]
    @view = View.new(@players)
    @bank = 0
  end

  def run
    @player.name = take_player_name
    loop do
      prepare_cards
      betting
      @view.show_table
      gameplay
      winner = counting_results
      give_reward(winner)
      @view.show_result(winner)
      return if zero_balance?
      return unless play_again?
    end
  end

  private

  def prepare_cards
    @deck = Deck.new if @deck.size < 6
    @players.each(&:reset_cards)
    @dealer.hide_cards
    2.times do
      @players.each { |player| add_card(player) }
    end
  end

  def gameplay
    players_enum = @players.to_enum
    loop do
      player = players_enum.next
      case make_choice(player)
      when 'n' then next
      when 'a' then add_card(player)
      when 'o' then break
      end
    end
    open_all_cart
    @view.show_table
  end

  def open_all_cart
    @players.each(&:reveal_cards)
  end

  def counting_results
    if @dealer.hand.points == @player.hand.points ||
       @player.hand.busted? && @dealer.hand.busted?
      return nil
    end

    return @dealer if @player.hand.busted?
    return @player if @dealer.hand.busted?

    @players.max_by { |player| player.hand.points }
  end

  def give_reward(winner)
    if winner.nil?
      @players.each { |player| player.balance.deposit(@bank / 2.to_f) }
    else
      winner.balance.deposit(@bank)
    end
    @bank = 0
    @view.show_table
  end

  def play_again?
    puts ''
    print 'Сыграть еще раз? (y/n): '
    gets.chomp == 'y'
  end

  def zero_balance?
    player = @players.find { |item| item.balance.zero? }
    puts "\nУ #{player.name.upcase} закончились деньги" if player
    !player.nil?
  end

  def add_card(player)
    player.receive_card(@deck.take_card)
  end

  def make_choice(player)
    if player.is_a? Dealer
      player.choice_action
    else
      @view.choice(player)
    end
  end

  def betting
    @players.each do |player|
      player.balance.withdraw(BET_SIZING)
      @bank += BET_SIZING
    end
  end

  def take_player_name
    print 'Введите своё имя: '
    gets.chomp
  end
end
