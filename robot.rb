require_relative 'attack'

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
    damage *= 2 if berserk?
    other_robot.take_damage(damage)

    Attack.new(damage, berserk?)
  end

  def take_damage(amount)
    @hp -= amount
  end

  def summary
    "#{@name}: #{@hp}HP #{berserk? ? "😤" : ""}"
  end

  def dead?
    @hp <= 0
  end

  private

  def berserk?
    @hp <= MAX_HEALTH * 0.2
  end
end
