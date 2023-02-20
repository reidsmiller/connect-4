class Game
  attr_reader :board, :game_win, :game_draw, :player_turns, :comp_turns, :player_wins, :comp_wins, :draws
  
  def initialize
    @board = Board.new
    @player_turns = [] #Should go in a new class GamePlay??
    @comp_turns = [] #Should go in a new class GamePlay??
    @game_win = nil
    @game_draw = false
    @player_wins = 0 #Should go in a new class GamePlay??
    @comp_wins = 0 #Should go in a new class GamePlay??
    @draws = 0 #Should go in a new class GamePlay??
  end

#Should go in a new class GamePlay??
  def player_turn
    column = gets.chomp
      if @board.place(column, 'X')
        @player_turns << column
        win?
      else
        puts 'That is not a valid selection, please select a new column'
        player_turn
      end
  end
#Should go in a new class GamePlay??
  def computer_turn
    comp_column = (65 + rand(7)).chr
    if @board.place(comp_column, 'O')
    @comp_turns << comp_column
    win?
    comp_column
    else 
      computer_turn
    end
  end


  def win?
    check_for_win(@board.board_array)
    check_for_win(vertical_sort)
    check_for_win(diagonal_up_sort)
    check_for_win(diagonal_down_sort)
    check_for_draw
  end

  def check_for_win(array)
    array.each do |row|
      row.each_cons(4) do |group|
        if group == ["X", "X", "X", "X"]
          @game_win = true
        elsif group == ["O", "O", "O", "O"] 
          @game_win = false
        end
      end
    end
  end

  def check_for_draw
    @game_draw = true if !@board.board_array.flatten.any?(/[.]/)
  end
  
  def vertical_sort
    @board.board_array.transpose
  end

  def diagonal_up_sort
    padding = 5
    padded_matrix = []

    @board.board_array.each do |row|
        inverse_padding = 5 - padding
        padded_matrix << ([nil] * inverse_padding) + row + ([nil] * padding)
        padding -= 1    
    end
    
    padded_matrix.transpose.map {|array| array.compact}
  end

  def diagonal_down_sort
    padding = 5
    padded_matrix = []

    @board.board_array.each do |row|
        inverse_padding = 5 - padding
        padded_matrix << ([nil] * padding) + row + ([nil] * inverse_padding)
        padding -= 1    
    end
    padded_matrix.transpose.map {|array| array.compact}
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
      @board.reset
      @game_win = nil
      @game_draw = false
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
    until @game_win != nil || game_draw == true
      puts `clear`
      puts "You chose #{@player_turns.last} and the computer chose #{@comp_turns.last}\n\n==============="
      @board.render
      puts "===============\n\nWhat column do you choose, intrepid player?"
      player_turn
      computer_turn
    end
    game_end
  end

  def game_end
    if @game_win == true
      puts `clear`
      @player_wins += 1
      puts 'YOU WON! HOW COOL!'
    elsif @game_win == false
      puts `clear`
      @comp_wins += 1
      puts "YOU LOST! You're not smart enough to beat a computer choosing random columns? Sad day."
    elsif @game_draw == true
      puts `clear`
      @draws += 1
      puts "That was a draw. BOOOOOOOORRRRRRIIIIIINGGGGGGGG. You're literally not smart enough to beat a computer choosing random columns."
    end
    puts "================================\n\nYou've won #{@player_wins} times\n\nThe computer has won #{@comp_wins} times\n\nYou've had #{@draws} draw matches\n\n================================\n\nPress any key to continue"
    gets.chomp
    game_menu
  end
end