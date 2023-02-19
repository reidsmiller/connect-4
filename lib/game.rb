class Game
  attr_reader :board, :game_win, :game_draw, :player_turns, :comp_turns, :player_wins, :comp_wins, :draws
  
  def initialize
    @board = Board.new
    @player_turns = []
    @comp_turns = []
    @game_win = nil
    @game_draw = false
    @player_wins = 0
    @comp_wins = 0
    @draws = 0
  end

  def player_turn(column)
    @board.place(column, "X")
    @player_turns << column
    win?
  end

  def computer_turn
    comp_column = (65 + rand(7)).chr
    @board.place(comp_column, "O")
    @comp_turns << comp_column
    win?
    comp_column
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

  def game_menu
    puts 'Welcome to Connect 4!! \n 
      Enter p to Enter p to play the highest stakes game of your life. Enter q to wimp out and quit.'
    ans = gets.chomp
    if ans == "p"
      @board = Board.new
      turn_round
    elsif ans == "q"
      puts `clear`
      puts 'GAME OVER'
    else
      puts `clear`
      puts "#{ans} isn't a valid answer fool!!"
      game_menu
    end
  end

  def turn_round
    until @game_win != nil || game_draw == true
      puts `clear`
      puts "You chose #{@player_turns.last} and the computer chose #{@comp_turns.last}"
      @board.render
      puts "What column do you choose, intrepid player?"
      player_turn(gets.chomp)
      computer_turn
    end
  end

  def game_end
    if @game_win == true
      puts `clear`
      @player_wins += 1
      puts 'YOU WON! HOW COOL!'
    elsif @game_win == false
      puts `clear`
      @comp_wins += 1
      puts "YOU LOST! YOU SUCK!  You're literally not smart enough to beat a computer choosing random columns."
    elsif @game_draw == true
      puts `clear`
      @draws += 1
      puts "That was a draw. BOOOOOOOORRRRRRIIIIIINGGGGGGGG. You're literally not smart enough to beat a computer choosing random columns."
    end
    puts "You've won #{@player_wins} times, the computer has won #{@comp_wins} times, and you've had #{@draws} draw matches."
    game_menu
  end
end