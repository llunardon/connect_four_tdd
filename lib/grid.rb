class Grid
  attr_accessor :columns, :c1, :c2, :c3, :c4, :c5, :c6, :c7  

  def initialize()
    @columns = [
      @c1 = Array.new(6, '_'),
      @c2 = Array.new(6, '_'),
      @c3 = Array.new(6, '_'),
      @c4 = Array.new(6, '_'),
      @c5 = Array.new(6, '_'),
      @c6 = Array.new(6, '_'),
      @c7 = Array.new(6, '_')
    ]
  end

  def print_grid()
    for i in (0..5) do
      @columns.each_with_index do |column, index|
        if index == 0
          print '|'
        end
        print "#{@columns[index][i]}" + '|'
      end
      puts ''
    end

    print "|1|2|3|4|5|6|7|\n"
  end

  def insert_token(symbol, column_number)
    if column_number > 7
      return false
    end
    enque(@columns[column_number - 1], '_', symbol)
  end

  def enque(array, init_token, sub_token)
    (0..array.length-1).reverse_each do |index|
      if array[index] == init_token
        array[index] = sub_token
        return true
      end
    end

    return false
  end

  def check_if_win(symbol)
    width = columns.length
    height = columns[0].length

    #vertical line?
    for j in (0..height-4) do
      for i in (0..width-1) do
        if @columns[j][i] == symbol && @columns[j+1][i] == symbol && @columns[j+2][i] == symbol && @columns[j+3][i] == symbol 
          return true
        end
      end
    end

    #horizontal line?
    for i in (0..width-4) do
      for j in (0..height-1) do
        if @columns[j][i] == symbol && @columns[j][i+1] == symbol && @columns[j][i+2] == symbol && @columns[j][i+3] == symbol 
          return true
        end
      end
    end

    #ascending diagonal?
    for i in (width-4..width-1) do
      for j in (0..height-4) do
        if @columns[j][i] == symbol && @columns[j+1][i-1] == symbol && @columns[j+2][i-2] == symbol && @columns[j+3][i-3] == symbol 
          return true
        end
      end
    end

    #descending diagonal?
    for i in (width-4..width-1) do
      for j in (3..height-1) do
        if @columns[j][i] == symbol && @columns[j-1][i-1] == symbol && @columns[j-2][i-2] == symbol && @columns[j-3][i-3] == symbol 
          return true
        end
      end
    end

    return false
  end
end
