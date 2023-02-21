require 'spec_helper'

RSpec.describe GamePlay do

  before(:each) do
    @game_play = GamePlay.new
  end
  describe '#initialize' do
    it 'exists' do
      expect(@game_play).to be_instance_of(GamePlay)
    end
  end
end