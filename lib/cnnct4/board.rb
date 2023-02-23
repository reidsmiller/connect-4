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
  
# break out into a few different methods
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
    end
    false
  end

  def reset
    @board_array = Array.new(6) { Array.new(7, ".")}
  end
end