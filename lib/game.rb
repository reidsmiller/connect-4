class Game

  attr_reader :board, :game_win
  def initialize
    @board = Board.new
    @turns = []
    @game_win = nil
  end

  def player_turn(column)
    @board.place(column, "X")
    self.win?
  end

  def computer_turn
    comp_column = (65 + rand(7)).chr
    @board.place(comp_column, "O")
    self.win?
    comp_column
  end

  def win?
    check_horizontal
    check_diagonal_up
  end

  def check_horizontal
    @board.board_array.each do |row|
      row.each_cons(4) do |location|
        if location == ["X", "X", "X", "X"]
          @game_win = true
        elsif location == ["O", "O", "O", "O"] 
          @game_win = false
        end
      end
    end
  end

  def check_diagonal_up
    padding = 5
    padded_matrix = []

    @board.board_array.each do |row|
        inverse_padding = 5 - padding
        padded_matrix << ([nil] * inverse_padding) + row + ([nil] * padding)
        padding -= 1    
    end
    
    padded_matrix.transpose.map {|array| array.compact}
  end
end