require_relative 'spec_helper'
require 'pry'

describe Robot do
  before :each do
    @robot = Robot.new
  end

  describe "#heal!" do
    it "Should raise exception if robot has no health" do
      allow(@robot).to receive(:health) {0}
      expect{@robot.heal!(20)}.to raise_error
    end
  end

  describe "#attack!" do
    subject = Laser.new

    it "should raise exception if attacking a robot" do
      expect{@robot.attack!(subject)}.to raise_error("Object is not a Robot")
    end
  end
end
