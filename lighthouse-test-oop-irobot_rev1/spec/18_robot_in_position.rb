require_relative 'spec_helper'

describe Robot do
  before do
    @robot3 = Robot.new
    @robot1 = Robot.new
    @robot2 = Robot.new(3,5)
  end

  describe "#self.robots_at" do
    it "should return an array of objects at a position" do
      expect(Robot.robots_at(0, 0)).to eq([@robot3, @robot1])
      expect(Robot.robots_at(3,5)).to eq([@robot2])
    end

    it "Should return false if nothing was found" do
      expect(Robot.robots_at(23,4)).to be_falsey
    end

  end

end
