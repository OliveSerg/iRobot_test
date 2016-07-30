require_relative 'spec_helper'

describe Robot do

  context "Shields"
    before do
      @robot = Robot.new
    end

    it "Robots should start with 50 shield" do
      expect(@robot.shield).to eq(50)
    end

    context "#wound"
      it "should drain shield first before health" do
        @robot.wound(20)
        expect(@robot.shield).to eq(30)
        expect(@robot.health).to eq(100)
      end

      it "should drain health after shield" do
        allow(@robot).to receive(:shield) {0}
        @robot.wound(20)
        expect(@robot.health).to eq(80)
      end
end
