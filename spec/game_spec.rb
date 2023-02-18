require 'spec_helper'

RSpec.describe Game do
  before(:each) do
    @game = Game.new
  end

  describe '#Initialize' do
    it 'exists' do
      expect(@game).to be_instance_of(Game)
    end

    it 'can take a player turn' do
      @game.player_turn("B")
      expect(@game.board.render).to eq([[".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", ".", ".", ".", ".", ".", "."],
        [".", "X", ".", ".", ".", ".", "."]])
    end

    it 'can take a computer turn' do
      expect(("A".."G").member?(@game.computer_turn)).to be true
    end
  end

  describe '#win game'
  it 'returns true when 4 pieces are in a row horizontally' do
    @game.player_turn("A")
    @game.player_turn("B")
    @game.player_turn("C")
    
    expect(@game.game_win).to be nil

    @game.player_turn("D")
    
    expect(@game.game_win).to be true
  end

  it 'returns false if the computer has 4 pieces in a row horizontally' do
    #forcing "O"'s since our computer is not that smart yet

    @game.board.place("A", "O")
    @game.board.place("B", "O")
    @game.board.place("C", "O")

    expect(@game.game_win).to be nil

    @game.board.place("D", "O")
    @game.win?

    expect(@game.game_win).to be false
  end

  it 'returns true when 4 pieces are in a row virtically' do
    @game.player_turn("B")
    @game.player_turn("B")
    @game.player_turn("B")

    expect(@game.game_win).to be nil

    @game.player_turn("B")

    expect(@game.game_win).to be true
  end

  it 'returns false when 4 computer pieces are in a row virtically' do
    #forcing "O"'s since our computer is not that smart yet
    @game.board.place("C", "O")
    @game.board.place("C", "O")
    @game.board.place("C", "O")

    expect(@game.game_win).to be nil

    @game.board.place("C", "O")
    @game.win?

    expect(@game.game_win).to be false
  end
end