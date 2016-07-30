
class Battery < Item

  def initialize
    super("Battery", 25)
  end

  def recharge_shield(robot)
    robot.shield = (self.weight)
  end
end
