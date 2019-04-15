require './turn'

class TurnManager
  def initialize players
    @players = players.dup.shuffle
    @current_round = 0
    @current_index = 0
  end

  def next_turn targets
    attacker = @players[@current_index]
    @current_index = (@current_index + 1) % @players.count

    target = targets.filter { |p| p != attacker }.sample
    
    @current_round += 1

    Turn.new attacker, target, @current_round
  end
end
