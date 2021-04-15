class Player
  attr_accessor :symbol, :name

  def initialize(symbol)
    puts "What\'s your name?"
    @name = gets.chomp
    @symbol = symbol
  end
end

#player1 = Player.new('#')
#p player1.name
#p player1.symbol
