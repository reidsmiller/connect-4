class Game

  attr_reader :board
  def initialize
    @board = Board.new
    @turns = []
  end

  def player_turn(column)
    @board.place(column, "X")
  end

  def computer_turn
    comp_column = (65 + rand(7)).chr
    @board.place(comp_column, "O")
    comp_column
  end
end