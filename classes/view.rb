# frozen_string_literal: true

class View
  def initialize(players)
    @players = players
  end

  def show_table
    clear
    @players.each do |player|
      puts player.name
      puts "Карты: #{cards(player)}"
      puts "Баллы: #{points(player)}\n"
      puts "Баланс: #{player.balance}\n"
      puts '*' * 30
    end
  end

  def choice(player)
    puts '[n] - Пропустить'
    puts '[a] - Добавить карту' if player.cards.size == 2
    puts '[o] - Открыть карты'
    print ':'
    gets.chomp
  end

  def show_result(winner)
    puts ''
    puts 'Результат: ничья' if winner.nil?
    puts "Результат: выиграл #{winner.name.upcase}" if winner
  end

  private

  def clear
    system('clear')
  end

  def points(player)
    return '**' if player.hidden_cards?

    player.hand.points
  end

  def cards(player)
    return '** ' * player.cards.size if player.hidden_cards?

    player.cards.map(&:to_s).join('  ')
  end
end
