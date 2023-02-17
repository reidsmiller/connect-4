class Player
  attr_reader :name, :board
  
  def initialize(name)
    @name = name
    @board = Board.new
  end

  def place(input)
    input.upcase!
    column = convert(input)
    row = 5
    while row >= 0
      if @board.board_array[row][column] == "."
        @board.board_array[row][column] = "X"
        break
      else
        row -= 1
      end
    end
    @board.render
  end

  def convert(letter)
    case letter
      when "A" then 0
      when "B" then 1
      when "C" then 2
      when "D" then 3
      when "E" then 4
      when "F" then 5
      when "G" then 6
    end
  end
end