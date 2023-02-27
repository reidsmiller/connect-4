class Cell
  attr_reader :row_pos, :column_pos
  attr_accessor :mark

  def initialize (row_pos, column_pos)
    @mark = "."
    @row_pos = row_pos
    @column_pos = column_pos
  end
end