class Turn
  attr_reader :attacker, :defender, :round_number

  def initialize(attacker, defender, round_number)
    @attacker = attacker
    @defender = defender
    @round_number = round_number
  end
end
