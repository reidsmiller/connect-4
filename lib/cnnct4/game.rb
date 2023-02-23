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

  # Look into .with_index
  #possibly making both diagonal up and down one method with arguments
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

  def comp_block
    if check_for_3_block(vertical_sort) == true
      true
    elsif check_for_3_block(@board.board_array) == true
      true
    elsif check_for_3_block(diagonal_up_sort) == true
      true
    elsif check_for_3_block(diagonal_down_sort) == true
      true
    else
      false
    end
  end

  def comp_wins
    check_for_3_win(vertical_sort)
  end

  def check_for_3_block(method)
    method.each do |row|
      row.each_cons(4) do |cell_row|
        mark_row = []
        cell_row.each {|cell| mark_row << cell.mark}
        if mark_row == [".", "X", "X", "X"]
          dot_pos = 0
          # select_one_down(group, dot_pos)
          @board.place(cell_row[dot_pos].column_pos, "O")
          return true
        elsif mark_row == ["X", "X", "X", "."]
          dot_pos = 3
          @board.place(cell_row[dot_pos].column_pos, "O")
          return true
        end
      end
    end
    return false
  end

  def check_for_3_win(method)
    @board.board_array.each do |row|
      mark_row = []
      row.each {|cell| mark_row << cell.mark}
      mark_row.each_cons(4) do |group|
        if group == [".", "O", "O", "O"]
          @board.place(row[0].column_pos, "O")
        end
      end
    end
  end
  def select_one_down(row, dot_pos)
    cell_down = @board.board_array.flatten.select do |cell| 
      cell.row_pos == row[dot_pos].row_pos + 1 && cell.column_pos == row[dot_pos].column_pos
    end
  end
end

