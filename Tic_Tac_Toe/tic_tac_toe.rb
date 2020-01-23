module GameValidations
end

class Game
end

board = [1, 2, 3, 4, 5, 6, 7, 8, 9]

def show_board(board)
  puts row1 = "#{board[0]}"" | ""#{board[1]}"" | ""#{board[2]}"
  puts separator = "---------"
  puts row2 = "#{board[3]}"" | ""#{board[4]}"" | ""#{board[5]}"
  puts separator
  puts row3 = "#{board[6]}"" | ""#{board[7]}"" | ""#{board[8]}"
end

def p1_turn(board)
  puts "Player 1 please type a number from 1 to 9 where do you want to put your x"
  p1 = gets.chomp.to_i
  board[p1-1] = "x"
  show_board(board)
end

def p2_turn(board)
  puts "Player 2 please type a number from 1 to 9 where do you want to put your o"
  p2 = gets.chomp.to_i
  board[p2-1] = "o"
  show_board(board)
end

def round_counter(board)
  
  tot_counter = 0

  while tot_counter <= 7
    p1_turn(board)
    p2_turn(board)  
    tot_counter += 2
  end

  p1_turn(board)

end

def check_winner(board)
    case check_winner(board)
    when board[0] == "x" && board[1] == "x" && board[2] == "x"
        puts "Player 1 wins"
    when board[0] == "o" && board[1] == "o" && board[2] == "o"
        puts "Player 2 wins"
    when board[3] == "x" && board[4] == "x" && board[5] == "x"
        puts "Player 1 wins"
    when board[3] == "o" && board[4] == "o" && board[5] == "o"
        puts "Player 2 wins"
    when board[6] == "x" && board[7] == "x" && board[8] == "x"
        puts "Player 1 wins"
    when board[6] == "o" && board[7] == "o" && board[8] == "o"
        puts "Player 2 wins"
    when board[0] == "x" && board[3] == "x" && board[6] == "x"
        puts "Player 1 wins"
    when board[0] == "o" && board[3] == "o" && board[6] == "o"
        puts "Player 2 wins"
    when board[1] == "x" && board[4] == "x" && board[7] == "x"
        puts "Player 1 wins"
    when board[1] == "o" && board[4] == "o" && board[7] == "o"
        puts "Player 2 wins"
    when board[2] == "x" && board[5] == "x" && board[8] == "x"
        puts "Player 1 wins"
    when board[2] == "o" && board[5] == "o" && board[8] == "o"
        puts "Player 2 wins"
    when board[0] == "x" && board[4] == "x" && board[8] == "x"
        puts "Player 1 wins"
    when board[0] == "o" && board[4] == "o" && board[8] == "o"
        puts "Player 2 wins"
    when board[2] == "x" && board[4] == "x" && board[6] == "x"
        puts "Player 1 wins"
    when board[2] == "o" && board[4] == "o" && board[6] == "o"
        puts "Player 2 wins"
    else
        puts "It's a tie"
    end
end


show_board(board)
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
round_counter(board)
#check_winner(board)
