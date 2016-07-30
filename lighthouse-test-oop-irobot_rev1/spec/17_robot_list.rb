require_relative 'spec_helper'

describe Robot do
  before do
    @robot1 = Robot.new
    @robot2 = Robot.new
    @robot3 = Robot.new
  end

  context "Keeping track of all robots instantiated"
    it "should be an array of all robots of the class" do
      expect(Robot.list).not_to be_empty
      expect(Robot.list[0]).to be_a Robot
    end

end
