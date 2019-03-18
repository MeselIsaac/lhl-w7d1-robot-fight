require_relative 'robot'

# Only this class (and main) will be "allowed" to call puts
class Game

  def initialize
    robot1 = Robot.new('Bender')
    robot2 = Robot.new('Wall-E')
    robot3 = Robot.new('Karen (From SpongeBob, aka Plankton\'s wife)')

    @robots = [robot1, robot2, robot3]
    @current_round = 1
    @current_robot = 0
  end

  # This method will handle the main game loop
  def play
    while (not game_over?)
      header "Round #{@current_round}"
      
      attacker = attacking_robot
      defender = defending_robot(attacker)

      puts "#{attacker.name} is attacking #{defender.name}!"

      amount = attacker.attack defender

      puts "#{attacker.name} does #{amount} damage!"

      header "Summary"

      puts game_summary

      next_turn

      sleep 0.75
    end
  end

  # methods declared after here will be marked as "private" 
  # i.e. they are not available outside of this class
  private

  def attacking_robot
    @robots[@current_robot]
  end

  def defending_robot(attacker)
    @robots.filter {|r| r != attacker }.sample
  end

  def next_turn
    @current_round += 1
    @current_robot = (@current_robot + 1) % @robots.count
  end

  def game_over?
    @robots.filter { |r| not r.dead? }.count == 1
  end

  def header(message)
    puts
    puts "===== #{message} ====="
    puts
  end

  def game_summary
    @robots.map { |r| r.summary }.join("\n")
  end
  
end
