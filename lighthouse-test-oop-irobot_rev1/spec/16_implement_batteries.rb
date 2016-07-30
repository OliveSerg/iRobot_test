require_relative 'spec_helper'

describe Battery do
  before do
    @battery = Battery.new
    @robot = Robot.new
  end
  it "should be and item" do
    expect(@battery).to be_a Item
  end

  describe "#recharge_shield" do
    it "should increase shield by battery weight" do
      allow(@robot).to receive(:shield) {10}
      expect(@battery.recharge_shield(@robot)).to eq(@battery.weight)
    end

    it "should increase shield to 50 and no more" do
      @robot.wound(20)
      @battery.recharge_shield(@robot)
      expect(@robot.shield).to eq(50)
    end
  end
end
