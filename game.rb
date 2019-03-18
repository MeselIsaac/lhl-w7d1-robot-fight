require_relative 'robot'
require_relative 'turn_manager'

# Only this class (and main) will be "allowed" to call puts
class Game

  def initialize
    robot1 = Robot.new('HAL 9000')
    robot2 = Robot.new('Wall-E')
    robot3 = Robot.new('Iron Man')
    robot4 = Robot.new('C3-P0')
    robot5 = Robot.new('R2-D2')
    @robots = [robot1, robot2, robot3, robot4, robot5]
    @turn_manager = TurnManager.new(@robots)
  end

  # This method will handle the main game loop
  def play
    while (!game_over?)
      turn = @turn_manager.next_turn

      pad "Round #{turn.round_number}"

      attacking_robot = turn.attacker
      defending_robot = turn.defender

      if attacking_robot.dead?
        puts "#{attacking_robot.name} is dead ☠️"
      else
        puts "#{attacking_robot.name} is attacking #{defending_robot.name}"

        attack = attacking_robot.attack(defending_robot)

        puts "#{attacking_robot.name} is going berserk 😤" if attack.berserk
        puts "#{attacking_robot.name} did #{attack.amount} damage"
      end

      pad "Summary"
      puts full_summary

      sleep 0.75
    end

    winning_robot = alive_robots[0]

    pad "Game Over!"
    puts "Winner is #{winning_robot.name}!"
  end

  # methods declared after here will be marked as "private" 
  # i.e. they are not available outside of this class
  private

  def pad(message)
    puts
    puts "===== #{message} ====="
    puts
  end

  def full_summary
    @robots.map {|r| r.summary }.join("\n")
  end

  def alive_robots
    @robots.filter { |r| not r.dead? }
  end

  def game_over?
    alive_robots.count == 1
  end
end
