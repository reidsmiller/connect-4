class Board
  attr_reader :board_array

  def initialize
    @board_array = [
      [Cell.new(0, 0), Cell.new(0, 1), Cell.new(0, 2), Cell.new(0, 3), Cell.new(0, 4), Cell.new(0, 5), Cell.new(0, 6)],
      [Cell.new(1, 0), Cell.new(1, 1), Cell.new(1, 2), Cell.new(1, 3), Cell.new(1, 4), Cell.new(1, 5), Cell.new(1, 6)],
      [Cell.new(2, 0), Cell.new(2, 1), Cell.new(2, 2), Cell.new(2, 3), Cell.new(2, 4), Cell.new(2, 5), Cell.new(2, 6)],
      [Cell.new(3, 0), Cell.new(3, 1), Cell.new(3, 2), Cell.new(3, 3), Cell.new(3, 4), Cell.new(3, 5), Cell.new(3, 6)],
      [Cell.new(4, 0), Cell.new(4, 1), Cell.new(4, 2), Cell.new(4, 3), Cell.new(4, 4), Cell.new(4, 5), Cell.new(4, 6)],
      [Cell.new(5, 0), Cell.new(5, 1), Cell.new(5, 2), Cell.new(5, 3), Cell.new(5, 4), Cell.new(5, 5), Cell.new(5, 6)]
    ]
  end

  def render
    puts " A B C D E F G"
    @board_array.each do |row|
      mark_row = []
      row.each {|cell| mark_row << cell.mark}
      print " #{mark_row.join(" ")}"
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
        if @board_array[row][column].mark == "."
          @board_array[row][column].mark = mark
          return true
        else
          row -= 1
        end
      end
    end
    false
  end

  def reset
    @board_array = [
      [Cell.new(0, 0), Cell.new(0, 1), Cell.new(0, 2), Cell.new(0, 3), Cell.new(0, 4), Cell.new(0, 5), Cell.new(0, 6)],
      [Cell.new(1, 0), Cell.new(1, 1), Cell.new(1, 2), Cell.new(1, 3), Cell.new(1, 4), Cell.new(1, 5), Cell.new(1, 6)],
      [Cell.new(2, 0), Cell.new(2, 1), Cell.new(2, 2), Cell.new(2, 3), Cell.new(2, 4), Cell.new(2, 5), Cell.new(2, 6)],
      [Cell.new(3, 0), Cell.new(3, 1), Cell.new(3, 2), Cell.new(3, 3), Cell.new(3, 4), Cell.new(3, 5), Cell.new(3, 6)],
      [Cell.new(4, 0), Cell.new(4, 1), Cell.new(4, 2), Cell.new(4, 3), Cell.new(4, 4), Cell.new(4, 5), Cell.new(4, 6)],
      [Cell.new(5, 0), Cell.new(5, 1), Cell.new(5, 2), Cell.new(5, 3), Cell.new(5, 4), Cell.new(5, 5), Cell.new(5, 6)]
    ]
  end
end