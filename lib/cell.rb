class Cell
  attr_reader :location, :value
  def initialize (location)
    @location = @location
    @value = "."
  end

  def player_select
    @value = "X"
  end

  def comp_select
    @value = "O"
  end
end