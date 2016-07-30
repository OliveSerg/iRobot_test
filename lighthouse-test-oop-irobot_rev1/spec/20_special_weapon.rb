require_relative 'spec_helper'

describe SpecialWeapon do
  before do
    @s_weapon = SpecialWeapon.new
    @robot1 = Robot.new
    @robot2 = Robot.new
    @robot3 = Robot.new
  end

  describe "#hit" do
    it "should hit a target and pierce shields" do
      @s_weapon.hit(@robot1)
      expect(@robot1.health).to eq(70)
    end

    it "should hit surronding targets" do
      @s_weapon.hit(@robot1)
      expect(@robot1.health).to eq(70)
      expect(@robot2.health).to eq(70)
      expect(@robot3.health).to eq(70)
    end
  end
end
