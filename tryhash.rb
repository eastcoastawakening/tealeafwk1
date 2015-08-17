#initialize the board with empty strings and return b 
def initialize_board
  b = {
  (1..9).each {|position| b[position] = ' '}
  b
end

#displays value of the board at each position
def draw_board(b)
  puts "#{b[1]} | #{b[2]}| #{b[3]}"
  puts "---------"
  puts "#{b[4]} | #{b[5]}| #{b[6]}"
  puts "---------"
  puts "#{b[7]} | #{b[8]}| #{b[9]}"
end

board = initialize_board
draw_board(board)