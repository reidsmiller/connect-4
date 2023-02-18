class Game

  attr_reader :board, :game_win
  def initialize
    @board = Board.new
    @turns = []
    @game_win = nil
  end

  def player_turn(column)
    @board.place(column, "X")
    win?
  end

  def computer_turn
    comp_column = (65 + rand(7)).chr
    @board.place(comp_column, "O")
    win?
    comp_column
  end

  def win?
    check_for_win(@board.board_array)
    check_for_win(vertical_sort)
    
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
end