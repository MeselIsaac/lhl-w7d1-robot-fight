class Robot
  attr_reader :name

  MAX_HEALTH = 50

  def initialize name
    @name = name
    @hp = MAX_HEALTH
    @ap = 10
  end

  def to_s
    "#{@name}: #{@hp}/#{MAX_HEALTH} #{status}"
  end

  def status
    if not alive?
      "☠️"
    elsif berserk?
      "😤"
    else
      ""
    end
  end

  def attack other_robot
    damage = rand(@ap) + 1

    damage *= 2 if berserk?

    other_robot.take_damage damage

    damage
  end

  def take_damage amount
    @hp -= amount
  end

  def alive?
    @hp > 0
  end

  def berserk?
    @hp < MAX_HEALTH * 0.2
  end
end
