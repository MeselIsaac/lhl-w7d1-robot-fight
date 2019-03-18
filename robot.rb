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

    damage
  end

  def take_damage(amount)
    @hp -= amount
  end

  def summary
    "#{@name}: #{@hp}HP #{status_summary}"
  end

  def status_summary
    if dead?
      "☠️"
    elsif berserk?
      "😤"
    else
      ""
    end
  end

  def dead?
    @hp <= 0
  end

  def berserk?
    @hp <= 0.2 * MAX_HEALTH
  end
  
end
