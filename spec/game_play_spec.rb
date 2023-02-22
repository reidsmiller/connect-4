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

  describe 'Game play functionality' do
    it 'has a logo' do
      expect(@game_play.logo).to eq('
==============================================================
_________                                     __       _____  
\_   ___ \  ____   ____   ____   ____   _____/  |_    /  |  | 
/    \  \/ /  _ \ /    \ /    \_/ __ \_/ ___\   __\  /   |  |_
\     \___(  <_> )   |  \   |  \  ___/\  \___|  |   /    ^   /
 \______  /\____/|___|  /___|  /\___  >\___  >__|   \____   | 
        \/            \/     \/     \/     \/            |__| 
==============================================================')
    end

    it 'has a game over logo' do
      expect(@game_play.game_over_logo).to eq('
       ________    _____      _____  ___________ ____________   _________________________ 
      /  _____/   /  _  \    /     \ \_   _____/ \_____  \   \ /   /\_   _____/\______   \
     /   \  ___  /  /_\  \  /  \ /  \ |    __)_   /   |   \   Y   /  |    __)_  |       _/
     \    \_\  \/    |    \/    Y    \|        \ /    |    \     /   |        \ |    |   \
      \______  /\____|__  /\____|__  /_______  / \_______  /\___/   /_______  / |____|_  /
             \/         \/         \/        \/          \/                 \/         \/ ')
    end
  end
end