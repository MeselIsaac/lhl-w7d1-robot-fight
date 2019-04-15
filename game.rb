require './robot'
require './turn_manager'

# Only this class (and main) will be "allowed" to call puts
class Game
  def initialize
    # TODO: Setup our robots
    robot1 = Robot.new 'Dave'
    robot2 = Robot.new 'Juan'
    robot3 = Robot.new 'Tim'

    @robots = [robot1, robot2, robot3]
    @turn_manager = TurnManager.new @robots
  end

  def run
    while (not game_over?)
      turn = @turn_manager.next_turn alive_robots

      header "Round #{turn.current_round}"

      if (not turn.attacker.alive?)
        puts "#{turn.attacker.name} is dead! ☠️"
      else
        puts "#{turn.attacker.name} is attacking #{turn.target.name}"
        puts "#{turn.attacker.name} is going berserk! 😤" if turn.attacker.berserk?
  
        damage = turn.attacker.attack turn.target
        puts "#{turn.target.name} took #{damage} damage"

        summary
      end

      sleep 0.5
    end
  end

  # methods declared after here will be marked as "private"
  # i.e. they are not available outside of this class
  private

  def next_turn
    @current_round += 1
    @current_index = (@current_index + 1) % @robots.count
  end

  def alive_robots
    @robots.filter { |r| r.alive? }
  end

  def target_robot attacker
    alive_robots.filter {|r| r != attacker }.sample
  end
  
  def game_over?
    alive_robots.count == 1
  end

  def header val
    puts
    puts "===== #{val} ====="
    puts
  end

  def summary
    header "Summary"
    @robots.each { |r| puts r }
  end
end
