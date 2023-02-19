class Game

  attr_reader :board, :game_win, :player_turns, :comp_turns
  def initialize
    @board = Board.new
    @player_turns = []
    @comp_turns = []
    @game_win = nil
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

  def turn_round
    until @game_win != nil
      puts `clear`
      puts "You chose #{@player_turns.last} and the computer chose #{@comp_turns.last}"
      puts board.render
      self.player_turn(gets.chomp)
      self.computer_turn
    end
  end
end