require 'thor'
require 'cnnct4'

module Cnnct4
  class CLI < Thor
    desc "Start Game", "Start CLI game in terminal"
    def self.start
      game = GamePlay.new
      game.game_menu
    end
  end
end