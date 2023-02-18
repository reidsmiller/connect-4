require 'spec_helper'

RSpec.describe Player do
  before(:each) do
    @player1 = Player.new("Rick")
    @board = Board.new
  end

  describe '#initialize' do
    it 'exists' do
      expect(@player1).to be_instance_of(Player)
    end

    it 'has a name' do
      expect(@player1.name).to eq("Rick")
    end
  end
end