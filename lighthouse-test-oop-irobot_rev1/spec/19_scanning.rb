require_relative 'spec_helper'

describe Robot do
  before do
    @robot1 = Robot.new
    @robot2 = Robot.new
    @robot3 = Robot.new
  end

  describe "#scanning" do
    it "should return an array of all robots near" do
      expect(@robot1.scanning).to eq([@robot2, @robot3])
    end
  end

end
