require './lib/connect_four'

describe ConnectFour do
  
  describe '#move' do
  subject(:connect_four) { described_class.new }

    it 'makes first move x in column 3' do
      column = connect_four.move('x', 3)

      expect(column[0]).to eq('x')
    end

    it 'makes second move o in column 3' do
      connect_four.move('x', 3)
      column = connect_four.move('o', 3)
      

      expect(column[1]).to eq('o')
    end
  
  end

  describe '#win?' do
    subject(:connect_four_win) { described_class.new }

    it 'wins vertically' do
      connect_four_win.move('x', 3)
      connect_four_win.move('x', 3)
      connect_four_win.move('x', 3)
      connect_four_win.move('x', 3)

      connect_four_win.show_grid
      expect(connect_four_win).to be_win
    end

    it 'wins horizontally' do
      connect_four_win.move('x', 0)
      connect_four_win.move('x', 1)
      connect_four_win.move('x', 2)
      connect_four_win.move('x', 3)

      connect_four_win.show_grid
      expect(connect_four_win).to be_win
    end

    it 'wins diagonally bottom-left to top-right' do
      connect_four_win.move('x', 0)

      connect_four_win.move('o', 1)
      connect_four_win.move('x', 1)
      
      connect_four_win.move('x', 2)
      connect_four_win.move('x', 2)
      connect_four_win.move('x', 2)
      
      connect_four_win.move('o', 3)
      connect_four_win.move('o', 3)
      connect_four_win.move('x', 3)
      connect_four_win.move('x', 3)

      connect_four_win.show_grid

      expect(connect_four_win).to be_win
    end

    it 'wins diagonally top-left to bottom-right' do
      connect_four_win.move('x', 3)

      connect_four_win.move('o', 2)
      connect_four_win.move('x', 2)
      
      connect_four_win.move('x', 1)
      connect_four_win.move('x', 1)
      connect_four_win.move('x', 1)
      
      connect_four_win.move('o', 0)
      connect_four_win.move('o', 0)
      connect_four_win.move('x', 0)
      connect_four_win.move('x', 0)

      connect_four_win.show_grid

      expect(connect_four_win).to be_win
    end
  end
  
  
end