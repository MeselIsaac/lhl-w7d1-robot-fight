require_relative 'turn'

class TurnManager
  def initialize(players)
    @players = players.dup
    @current_turn = 0
    @current_round = 1
  end

  def next_turn(possible_targets)
    attacker = get_attacker
    defender = get_defender(attacker, possible_targets)
    current_round = @current_round

    increment_round

    Turn.new(attacker, defender, current_round)
  end

  private

  def get_attacker
    @players[@current_turn]
  end

  def get_defender(attacker, targets)
    targets.filter { |p| p != attacker }.sample
  end

  def increment_round
    @current_round += 1
    @current_turn = (@current_turn + 1) % @players.count
  end

end
