class Player
  attr_reader :name, :board
  
  def initialize(name)
    @name = name
    @board = Board.new
  end
end