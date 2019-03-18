require_relative 'turn'

class TurnManager
  def initialize(players)
    @players = players.dup
    @current_turn = 1
  end

  def next_turn
    attacker = get_attacker
    defender = get_defender attacker

    Turn.new(
      attacker,
      defender,
      increment_turn
    )
  end

  private

  def increment_turn
    current_turn = @current_turn
    @current_turn += 1
    current_turn
  end

  def get_attacker
    index = (@current_turn - 1) % @players.count

    @players[index]
  end

  def get_defender(attacker)
    @players.filter {|r| r != attacker }.sample
  end
end
