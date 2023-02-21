require 'spec_helper'

RSpec.describe GamePlay do

  before(:each) do
    @game_play = GamePlay.new
  end
  describe '#initialize' do
    it 'exists' do
      expect(@game_play).to be_instance_of(GamePlay)
    end

    it 'can have the computer make a valid column selection' do
      expect(("A".."G").member?(@game_play.computer_turn)).to be true
    end
  end
end