require 'thor'
require 'connect_4'

module Connect4
  class CLI < Thor
    desc "Start Game", "Start CLI game in terminal"
    def self.start
      game = GamePlay.new
      game.game_menu
    end
  end
end