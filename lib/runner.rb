require_relative 'board'

board = Board.new

puts 'Welcome to connect 4!!'

board.render

player1.place(gets.chomp)