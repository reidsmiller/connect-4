class Game
  attr_reader :board
  attr_accessor :game_win, :game_draw
  
  def initialize
    @board = Board.new
    @game_win = nil
    @game_draw = false
    
  end

  def win?
    check_for_win(@board.board_array)
    check_for_win(vertical_sort)
    check_for_win(diagonal_up_sort)
    check_for_win(diagonal_down_sort)
    check_for_draw
  end

  def check_for_win(array)
    array.each do |row|
      mark_row = []
      row.each {|cell| mark_row << cell.mark}
      mark_row.each_cons(4) do |group|
        if group == ["X", "X", "X", "X"]
          @game_win = true
        elsif group == ["O", "O", "O", "O"] 
          @game_win = false
        end
      end
    end
  end

  def check_for_draw
    @game_draw = true if @board.board_array.flatten.none? {|cell| cell.mark == "."}
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

  def comp_check
    if check_for_3(vertical_sort)
      true
    elsif check_for_3(@board.board_array)
      true
    elsif check_for_3(diagonal_up_sort)
      true
    elsif check_for_3(diagonal_down_sort)
      true
    else
      false
    end
  end

  def check_for_3(method)
    catch(:done) do
      method.each do |row|
        row.each_cons(4) do |cell_row|
          mark_row = []
          cell_row.each {|cell| mark_row << cell.mark}
          check_win(cell_row, mark_row)
          check_block(cell_row, mark_row)
        end
      end
      false
    end
  end
  
  def check_one_mark_down_and_place(cell_row, dot_pos)
    cell_down = @board.board_array.flatten.select do |cell| 
      cell.row_pos == cell_row[dot_pos].row_pos + 1 && cell.column_pos == cell_row[dot_pos].column_pos
    end
    if cell_down[0]&.mark != "."
      @board.place(cell_row[dot_pos].column_pos, "O")
      throw(:done, true)
    end
  end
  
  def check_win(cell_row, mark_row)
    if mark_row == [".", "O", "O", "O"]
      dot_pos = 0
      check_one_mark_down_and_place(cell_row, dot_pos)
    elsif mark_row == ["O", ".", "O", "O"]
      dot_pos = 1
      check_one_mark_down_and_place(cell_row, dot_pos)
    elsif mark_row == ["O", "O", ".", "O"]
      dot_pos = 2
      check_one_mark_down_and_place(cell_row, dot_pos)
    elsif mark_row == ["O", "O", "O", "."]
      dot_pos = 3
      check_one_mark_down_and_place(cell_row, dot_pos)
    end
  end
  
  def check_block(cell_row, mark_row)
    if mark_row == [".", "X", "X", "X"]
      dot_pos = 0
      check_one_mark_down_and_place(cell_row, dot_pos)
    elsif mark_row == ["X", ".", "X", "X"]
      dot_pos = 1
      check_one_mark_down_and_place(cell_row, dot_pos)
    elsif mark_row == ["X", "X", ".", "X"]
      dot_pos = 2
      check_one_mark_down_and_place(cell_row, dot_pos)
    elsif mark_row == ["X", "X", "X", "."]
      dot_pos = 3
      check_one_mark_down_and_place(cell_row, dot_pos)
    end
  end
end


