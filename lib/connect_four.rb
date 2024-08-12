class ConnectFour

  def initialize

    @array = Array.new(7) { Array.new(6)}

    
  end

  def play
    

  end

  def win?
    return true if horizontal_win?
    return true if vertical_win?
    return true if diagonal_win?
    false
  end
  
  def vertical_win?
    @array.each do |column|

      next if column.compact.size < 4

      column.each_cons(4) do |segment|
        if segment.all? { |value| value == segment[0] && !value.nil? }
          return true
        end
      end
    end
    false
  end

  def horizontal_win?
    transposed_array = @array.transpose
  
    transposed_array.each do |row|
      row.each_cons(4) do |segment|
        if segment.all? { |value| value == segment[0] && !value.nil? }
          return true
        end
      end
    end
    false
  end

  def diagonal_win?
    (0..3).each do |col|
      (0..2).each do |row|
        if @array[col][row] && 
           @array[col][row] == @array[col + 1][row + 1] && 
           @array[col][row] == @array[col + 2][row + 2] && 
           @array[col][row] == @array[col + 3][row + 3]
          return true
        end
      end
    end
  
    (0..3).each do |col|
      (3..5).each do |row|
        if @array[col][row] && 
           @array[col][row] == @array[col + 1][row - 1] && 
           @array[col][row] == @array[col + 2][row - 2] && 
           @array[col][row] == @array[col + 3][row - 3]
          return true
        end
      end
    end
  
    false
  end
  

  def move(sign, column)   
    row = @array[column].index(nil)
    @array[column][row] = sign
    @array[column]
  end

  def column_full?(column)
    return true if @array[column].compact.size >= 6
    false
  end

  def show_grid
    puts ''
    6.downto(0) do |i|
      row = ""
      0.upto(5) do |j|
        value = @array[i][j]
        value = "-" if @array[i][j].nil?
        row = row.concat(value, " ")
      end
      puts row
    end
  end

end



