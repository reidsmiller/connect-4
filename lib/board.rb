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
  def place(input)
    input.upcase!
    if ("A".."G").member?(input)
      column = input.ord - 65
      row = 5
      while row >= 0
        if @board_array[row][column] == "."
          @board_array[row][column] = "X"
          return true
        else
          row -= 1
        end
      end
    end
    false
  end
end