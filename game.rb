require_relative 'robot'

# Only this class (and main) will be "allowed" to call puts
class Game

  def initialize
    robot1 = Robot.new('HAL 9000')
    robot2 = Robot.new('Wall-E')
    @robots = [robot1, robot2]
    @current_turn = 1
  end

  # This method will handle the main game loop
  def play
    while (!game_over?)
      pad "Round #{@current_turn}"

      attacking_robot = @robots[0]

      defending_robot = @robots[1]

      puts "#{attacking_robot.name} is attacking #{defending_robot.name}"

      damage = attacking_robot.attack(defending_robot)

      puts "#{attacking_robot.name} did #{damage} damage"

      pad "Summary"
      puts full_summary

      sleep 1

      next_turn
    end

    winning_robot = alive_robots[0]

    pad "Game Over!"
    puts "Winner is #{winning_robot.name}!"
  end

  # methods declared after here will be marked as "private" 
  # i.e. they are not available outside of this class
  private

  def next_turn
    @current_turn += 1
  end

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
