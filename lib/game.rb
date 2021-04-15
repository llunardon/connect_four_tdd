require_relative 'player.rb'
require_relative 'grid.rb'

def play_game
  grid = Grid.new
  player1 = Player.new('#')
  player2 = Player.new('*')
  grid.print_grid

  loop do
    return if play_round(player1, grid)
    return if play_round(player2, grid)
  end
end

def play_round(player, grid)
  puts 'In what column do you want to insert the token?'
  column = gets.chomp.to_i
  grid.insert_token(player.symbol, column)
  grid.print_grid
  if grid.check_if_win(player.symbol)
    puts "#{player.name} won!"
    return true
  end
  return true if grid.check_if_full?
end

play_game
