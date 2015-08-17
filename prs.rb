#all players pick paper, rock or scissors
#compare: paper > rock, rock > scissors, scissors > paper
#or tie if same
#play again

CHOICES = {'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors'}
puts "Welcome to Paper, Rock, Scissors Game"

def display_winning_message(winning_choice)
  case winning_choice
  when 'p'
    puts "Paper wraps Rock!"
  when 'r'
    puts "Rock smashes Scissors"
  when 's'
    puts "Scissors slashes Paper"
  end
end

loop do
  #player makes a pick, keep asking until selected
  begin
    puts "please choose paper, rock or scissors (p,r,s)"
    player_choice = gets.chomp.downcase
  end until CHOICES.keys.include?(player_choice)

  #computer makes a pick
  puts "you picked correctly"
  computer_choice = CHOICES.keys.sample
    if player_choice == computer_choice
      puts "It's a tie!"
    elsif (player_choice == 'p' && computer_choice == 'r') || (player_choice == 'r' && computer_choice == 's') || (player_choice == 's' && computer_choice == 'p')
      display_winning_message(player_choice)
      puts "You Won!"
    else
      display_winning_message(computer_choice)
      puts "Computer Won!"
    end
    puts "type n to end game or y to play again"
    break if gets.chomp.downcase != 'y' 
end
puts "Goodbye !"
