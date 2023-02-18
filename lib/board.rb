class Board
  attr_reader :board_array

  def initialize
    @board_array = Array.new(6) { Array.new(7, ".")}
  end

  def render
    puts " A B C D E F G"
    @board_array.each do |row|
      print " #{row.join(" ")}"
      puts
    end
  end

  # Will probably need to refactor with some helpers since this is a little long (future us problem :) )
  # Future thought, what if we set a second parameter for either player or computer, then we can choose between
  # an "X" or an "O" to place in the location.
  def place(column, mark)
    column.upcase!
    if ("A".."G").member?(column)
      column = column.ord - 65
      row = 5
      while row >= 0
        if @board_array[row][column] == "."
          @board_array[row][column] = mark
          return true
        else
          row -= 1
        end
      end
    else
      column = column.ord - 65
    end
    puts "Column #{(65 + column).chr} is not a valid choice! Please choose another column."
    false
  end
end