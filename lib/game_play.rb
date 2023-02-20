
class GamePlay
attr_reader :player_turns, :comp_turns, :player_wins, :comp_wins, :draws
  def initialize
    @game = Game.new
    @player_turns = [] #Should go in a new class GamePlay??
    @comp_turns = [] #Should go in a new class GamePlay??
    @player_wins = 0 #Should go in a new class GamePlay??
    @comp_wins = 0 #Should go in a new class GamePlay??
    @draws = 0 #Should go in a new class GamePlay??
  end

  #Should go in a new class GamePlay??
  def player_turn
    column = gets.chomp
      if @game.board.place(column, 'X')
        @player_turns << column
        @game.win?
      else
        puts 'That is not a valid selection, please select a new column'
        player_turn
      end
  end

  #Should go in a new class GamePlay??
  def computer_turn
    comp_column = (65 + rand(7)).chr
    if @game.board.place(comp_column, 'O')
    @comp_turns << comp_column
    @game.win?
    comp_column
    else 
      computer_turn
    end
  end


  #Should go in a new class GamePlay??
  def game_menu
    puts`clear`
    puts '
==============================================================
_________                                     __       _____  
\_   ___ \  ____   ____   ____   ____   _____/  |_    /  |  | 
/    \  \/ /  _ \ /    \ /    \_/ __ \_/ ___\   __\  /   |  |_
\     \___(  <_> )   |  \   |  \  ___/\  \___|  |   /    ^   /
 \______  /\____/|___|  /___|  /\___  >\___  >__|   \____   | 
        \/            \/     \/     \/     \/            |__| 
=============================================================='
    puts
    puts 'Enter p to play the highest stakes game of your life. Enter q to wimp out and quit.'
    ans = gets.chomp
    if ans == "p"
      @game.board.reset
      @game.game_win = nil
      @game.game_draw = false
      turn_round
    elsif ans == "q"
      puts `clear`
      puts '
       ________    _____      _____  ___________ ____________   _________________________ 
      /  _____/   /  _  \    /     \ \_   _____/ \_____  \   \ /   /\_   _____/\______   \
     /   \  ___  /  /_\  \  /  \ /  \ |    __)_   /   |   \   Y   /  |    __)_  |       _/
     \    \_\  \/    |    \/    Y    \|        \ /    |    \     /   |        \ |    |   \
      \______  /\____|__  /\____|__  /_______  / \_______  /\___/   /_______  / |____|_  /
             \/         \/         \/        \/          \/                 \/         \/ '
      puts "\n\n"
    else
      puts `clear`
      puts "#{ans} isn't a valid answer fool!!"
      game_menu
    end
  end

  def turn_round
    until @game.game_win != nil || @game.game_draw == true
      puts `clear`
      puts "You chose #{@player_turns.last} and the computer chose #{@comp_turns.last}\n\n==============="
      @game.board.render
      puts "===============\n\nWhat column do you choose, intrepid player?"
      player_turn
      computer_turn
    end
    game_end
  end

  def game_end
    if @game.game_win == true
      puts `clear`
      @player_wins += 1
      puts 'YOU WON! HOW COOL!'
    elsif @game.game_win == false
      puts `clear`
      @comp_wins += 1
      puts "YOU LOST! You're not smart enough to beat a computer choosing random columns? Sad day."
    elsif @game.game_draw == true
      puts `clear`
      @draws += 1
      puts "That was a draw. BOOOOOOOORRRRRRIIIIIINGGGGGGGG. You're literally not smart enough to beat a computer choosing random columns."
    end
    puts "================================\n\nYou've won #{@player_wins} times\n\nThe computer has won #{@comp_wins} times\n\nYou've had #{@draws} draw matches\n\n================================\n\nPress any key to continue"
    gets.chomp
    game_menu
  end
end