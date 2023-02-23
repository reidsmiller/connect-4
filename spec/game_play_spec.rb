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
    
    it 'can print an invalid selection message' do
      expect{@game_play.invalid_selection_message}.to output("That is not a valid selection, please select a new column\n").to_stdout
    end

    it 'can print the column choose string' do
      expect{@game_play.column_choice('Thomas')}.to output("What column do you choose, Thomas?\n").to_stdout
    end
    
    it 'can print the board with lines' do
      expect{@game_play.render_board_with_lines}.to output("\n\n===============\n A B C D E F G\n . . . . . . .\n . . . . . . .\n . . . . . . .\n . . . . . . .\n . . . . . . .\n . . . . . . .\n===============\n\n").to_stdout
    end
    
    it 'can print out the last moves made' do
      expect{@game_play.show_last_moves('Thomas', 'Reid', ['A'], ['B'])}.to output("Thomas chose A and Reid chose B\n").to_stdout
    end

    it 'can determine if the game is over' do
      expect(@game_play.game_over?).to be false

      22.times do 
        @game_play.computer_turn
      end
      
      expect(@game_play.game_over?).to be true
    end
  end
end