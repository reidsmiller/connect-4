
class GamePlay
attr_reader :player_turns, :comp_turns, :player_wins, :comp_wins, :draws
  def initialize
    @player1_name = nil
    @player2_name = nil
    @game = Game.new
    @player_turns = [] 
    @player2_turns = []
    @comp_turns = [] 
    @player_wins = 0 
    @player2_wins = 0
    @comp_wins = 0 
    @draws = 0 
  end

  def player_turn1
    column = gets.chomp
      if @game.board.place(column, 'X')
        @player_turns << column
        @game.win?
      else
        puts 'That is not a valid selection, please select a new column'
        player_turn1
      end
  end

  def player_turn2
    column = gets.chomp
      if @game.board.place(column, 'O')
        @player2_turns << column
        @game.win?
      else
        puts 'That is not a valid selection, please select a new column'
        player_turn2
      end
  end
  
  # can right a test for this. 
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
    puts 'Enter p to play the highest stakes game of your life with a computer. Enter 2 to play with two players. Enter q to wimp out and quit.'
    ans = gets.chomp
    if ans == "p"
      @game.board.reset
      @game.game_win = nil
      @game.game_draw = false
      @player_turns = [] 
      @comp_turns = [] 
      turn_round
    elsif ans == '2'
      @game.board.reset
      @game.game_win = nil
      @game.game_draw = false
      @player_turns = [] 
      @player2_turns = []
      turn_round_two_players
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

  def turn_round_two_players
    puts `clear`
    if @player1_name == nil
      puts 'Player 1 enter your name, your token is a X'
      @player1_name = gets.chomp 
      puts 'Player 2 enter your name, your token is an O'
      @player2_name = gets.chomp
      puts `clear`
    end
    until @game.game_win != nil || @game.game_draw == true
      puts "#{@player1_name} chose #{@player_turns.last} and #{@player2_name} chose #{@player2_turns.last}" if @player_turns != [] && @player2_turns != []
      puts "\n\n==============="
      @game.board.render
      puts "===============\n\nWhat column do you choose, #{@player1_name}?"
      player_turn1
      if @game.game_win == true
        break
      end
      puts `clear`
      puts "\n\n==============="
      @game.board.render
      puts "===============\n\nWhat column do you choose, #{@player2_name}?"
      player_turn2
      puts `clear`
    end
    game_end_two_player
  end

  def turn_round
    until @game.game_win != nil || @game.game_draw == true
      puts `clear`
      puts "You chose #{@player_turns.last} and the computer chose #{@comp_turns.last}" if @player_turns != []
      puts "\n\n==============="
      @game.board.render
      puts "===============\n\nWhat column do you choose, intrepid player?"
      player_turn1
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
    puts "================================\n\nYou've won #{@player_wins} times\n\nThe computer has won #{@comp_wins} times\n\nYou've had #{@draws} draw matches\n\n================================\n\nPress ENTER to continue"
    gets.chomp
    game_menu
  end

  def game_end_two_player
    if @game.game_win == true
      puts `clear`
      @player_wins += 1
      puts "#{@player1_name.capitalize} WON! HOW COOL!"
    elsif @game.game_win == false
      puts `clear`
      @player2_wins += 1
      puts "#{@player2_name.capitalize} WON! HOW COOL!"
    elsif @game.game_draw == true
      puts `clear`
      @draws += 1
      puts "That was a draw. BOOOOOOOORRRRRRIIIIIINGGGGGGGG."
    end
    puts "================================\n\n#{@player1_name} won #{@player_wins} times\n\n#{@player2_name} won #{@player2_wins} times\n\nYou've had #{@draws} draw matches\n\n================================\n\nPress ENTER to continue"
    gets.chomp
    game_menu
  end
end