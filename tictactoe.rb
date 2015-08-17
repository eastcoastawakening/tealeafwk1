#need to model the state of the board
#one hash that contains the numbers 1-9 are the position
#thus board (position, X or O or empty ' ') key, value pairs
#board = {1 => ' ', 2 => ' ', 3 => ' '}
#now assign a variable.....board[8]='X'

#initialize the board with empty strings and return b 
def initialize_board
  board = {}
  (1..9).each {|position| board[position] = ' '}
  board
end

#check for empty positions
#keys will give us the positions that are empty
def empty_positions(board)
  board.keys.select {|position| board[position] == ' '}
end

#displays value of the board at each position
def draw_board(b)
  system 'clear'
  puts "#{b[1]} | #{b[2]}| #{b[3]}"
  puts "---------"
  puts "#{b[4]} | #{b[5]}| #{b[6]}"
  puts "---------"
  puts "#{b[7]} | #{b[8]}| #{b[9]}"
end

#ask about this empty until line
def player_picks_square(board)
  begin
    puts "Pick a square (1-9)"
    position = gets.chomp.to_i
  end until empty_positions(board).include?(position)
  board[position] = 'X' 
end

#for now just sample - later we can pick highest weight
def computer_picks_square(board)
  puts "Pick a square of whats left from (1-9)"
  position = empty_positions(board).sample
  board[position] = 'O'
end

def check_winner(board)
  # brute force way to check for winners
  winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  winning_lines.each do |line|
    return "Player" if board.values_at(*line).count('X') == 3
    return "Computer" if board.values_at(*line).count('O') == 3
  end
  nil
end

def nine_positions_are_filled?(board)
  empty_positions(board) == []
end

def announce_winner(winner)
  puts "#{winner} won!"
end

#board keeps track of the state of the board and we need
#to pass in the board variable to draw_board
board = initialize_board

draw_board(board)

begin
  player_picks_square(board)
  draw_board(board)
  computer_picks_square(board)
  draw_board(board)
  winner = check_winner(board)
end until winner || empty_positions(board).empty?

if winner
  puts "its a winner"
else 
  puts "its a tie"
end