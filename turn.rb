class Turn
  attr_reader :attacker, :target, :current_round

  def initialize attacker, target, round
    @attacker = attacker
    @target = target
    @current_round = round
  end
end
