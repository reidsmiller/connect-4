require 'spec_helper'

RSpec.describe Board do
  before(:each) do
    @board = Board.new
  end

  describe '#Initialize' do
    it 'exists' do
      expect(board).to be_instance_of(Board)
    end

    it 'can contain an array of cells' do

    end

    it 'can convert cells to terminal output' do
      
    end
  end
end