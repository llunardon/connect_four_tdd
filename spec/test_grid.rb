require_relative '../lib/grid.rb'

describe Grid do
  context "When created" do
    it 'should have six rows' do
      grid = Grid.new
      expect(grid.columns[0].length).to eq(6)
    end

    it 'should have seven columns' do 
      grid = Grid.new
      expect(grid.columns.length).to eq(7)
    end
  end
end
