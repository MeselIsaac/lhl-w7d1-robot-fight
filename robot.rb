class Robot
  attr_reader :name

  MAX_HEALTH = 50

  def initialize(name)
    @name = name
    @hp = MAX_HEALTH
    @ap = 10
  end
end
