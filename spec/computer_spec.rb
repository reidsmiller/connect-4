require 'spec_helper'

RSpec.describe Computer do
  describe '#Initialize' do
    it 'exists' do
      expect(comp).to be_instance_of(Computer)
    end
  end
end