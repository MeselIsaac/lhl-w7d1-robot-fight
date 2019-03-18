class Robot
  attr_reader :name

  MAX_HEALTH = 50

  def initialize(name)
    @name = name
    @hp = MAX_HEALTH
    @ap = 10
  end

  def attack(other_robot)
    damage = rand(@ap) + 1
    other_robot.take_damage(damage)

    damage
  end

  def take_damage(amount)
    @hp -= amount
  end

  def summary
    "#{@name}: #{@hp}HP"
  end
  
end
