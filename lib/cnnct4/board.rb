class Board
  attr_reader :board_array

  def initialize
    @board_array = [
      [Cell.new(0, 'A'), Cell.new(0, 'B'), Cell.new(0, 'C'), Cell.new(0, 'D'), Cell.new(0, 'E'), Cell.new(0, 'F'), Cell.new(0, 'G')],
      [Cell.new(1, 'A'), Cell.new(1, 'B'), Cell.new(1, 'C'), Cell.new(1, 'D'), Cell.new(1, 'E'), Cell.new(1, 'F'), Cell.new(1, 'G')],
      [Cell.new(2, 'A'), Cell.new(2, 'B'), Cell.new(2, 'C'), Cell.new(2, 'D'), Cell.new(2, 'E'), Cell.new(2, 'F'), Cell.new(2, 'G')],
      [Cell.new(3, 'A'), Cell.new(3, 'B'), Cell.new(3, 'C'), Cell.new(3, 'D'), Cell.new(3, 'E'), Cell.new(3, 'F'), Cell.new(3, 'G')],
      [Cell.new(4, 'A'), Cell.new(4, 'B'), Cell.new(4, 'C'), Cell.new(4, 'D'), Cell.new(4, 'E'), Cell.new(4, 'F'), Cell.new(4, 'G')],
      [Cell.new(5, 'A'), Cell.new(5, 'B'), Cell.new(5, 'C'), Cell.new(5, 'D'), Cell.new(5, 'E'), Cell.new(5, 'F'), Cell.new(5, 'G')]
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
      [Cell.new(0, 'A'), Cell.new(0, 'B'), Cell.new(0, 'C'), Cell.new(0, 'D'), Cell.new(0, 'E'), Cell.new(0, 'F'), Cell.new(0, 'G')],
      [Cell.new(1, 'A'), Cell.new(1, 'B'), Cell.new(1, 'C'), Cell.new(1, 'D'), Cell.new(1, 'E'), Cell.new(1, 'F'), Cell.new(1, 'G')],
      [Cell.new(2, 'A'), Cell.new(2, 'B'), Cell.new(2, 'C'), Cell.new(2, 'D'), Cell.new(2, 'E'), Cell.new(2, 'F'), Cell.new(2, 'G')],
      [Cell.new(3, 'A'), Cell.new(3, 'B'), Cell.new(3, 'C'), Cell.new(3, 'D'), Cell.new(3, 'E'), Cell.new(3, 'F'), Cell.new(3, 'G')],
      [Cell.new(4, 'A'), Cell.new(4, 'B'), Cell.new(4, 'C'), Cell.new(4, 'D'), Cell.new(4, 'E'), Cell.new(4, 'F'), Cell.new(4, 'G')],
      [Cell.new(5, 'A'), Cell.new(5, 'B'), Cell.new(5, 'C'), Cell.new(5, 'D'), Cell.new(5, 'E'), Cell.new(5, 'F'), Cell.new(5, 'G')]
    ]
  end
end