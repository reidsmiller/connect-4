class Player
  attr_reader :name
  
  def initialize(name)
    @name = name
  end

  def place(input)
    input.upcase!
  end

  def convert(letter)
    case letter
      when "A" then 0
      when "B" then 1
      when "C" then 2
      when "D" then 3
      when "E" then 4
      when "F" then 5
      when "G" then 6
    end
  end
end