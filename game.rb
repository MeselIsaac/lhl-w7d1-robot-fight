require_relative 'robot'

# Only this class (and main) will be "allowed" to call puts
class Game

  def initialize
    robot1 = Robot.new('Bender')
    robot2 = Robot.new('Wall-E')
    robot3 = Robot.new('Karen (From SpongeBob, aka Plankton\'s wife)')

    @robots = [robot1, robot2, robot3]
  end

  # This method will handle the main game loop
  def play
    header "Round 1"
    
    attacker = @robots[0]
    defender = @robots[1]

    puts "#{attacker.name} is attacking #{defender.name}!"

    amount = attacker.attack defender

    puts "#{attacker.name} does #{amount} damage!"

    header "Summary"

    puts game_summary
  end

  # methods declared after here will be marked as "private" 
  # i.e. they are not available outside of this class
  private

  def header(message)
    puts
    puts "===== #{message} ====="
    puts
  end

  def game_summary
    @robots.map { |r| r.summary }.join("\n")
  end
  
end
