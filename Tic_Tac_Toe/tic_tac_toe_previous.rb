class Game
  
  @@message = "It's a tie"
  
  def initalize(board, tot_counter)
    @board = board
    @tot_counter = tot_counter
  end

  def show_board(board)
    puts row1 = "#{board[0]}"" | ""#{board[1]}"" | ""#{board[2]}"
    puts separator = "---------"
    puts row2 = "#{board[3]}"" | ""#{board[4]}"" | ""#{board[5]}"
    puts separator
    puts row3 = "#{board[6]}"" | ""#{board[7]}"" | ""#{board[8]}"
  end

  def p1_turn(board)
    puts "Player 1 please type a number from 1 to 9 where do you want to put your x"
    p = gets.chomp.to_i
    puts "Please type a valid input" if p.between?(1, 9) == false
    puts "Sorry that cell is taken" if board[p-1] != " "
    board[p-1] = "x" if p.between?(1, 9) && board[p-1] == " "
    show_board(board) 
  end

  def p2_turn(board)
    puts "Player 2 please type a number from 1 to 9 where do you want to put your o"
    p = gets.chomp.to_i
    puts "Please type a valid input" if p.between?(1, 9) == false
    puts "Sorry that cell is taken" if board[p-1] == " "
    board[p-1] = "o" if p.between?(1, 9) && board[p-1] == " "
    show_board(board)
  end

  def play_game(board) 
    
    tot_counter = 0  
    while tot_counter <= 7
      p1_turn(board) 
      check_winner(board)
      return if @@message == "Player 1 wins" || @@message == "Player 2 wins"
      p2_turn(board)
      check_winner(board) 
      return if @@message == "Player 1 wins" || @@message == "Player 2 wins"
      tot_counter += 2  
    end  
    p1_turn(board)
    check_winner(board)
    if @@message == "It's a tie" 
      puts @@message 
    end
  end

  def check_winner(board)   
    puts @@message = "Player 1 wins" if board[0] == "x" && board[1] == "x" && board[2] == "x"    
    puts @@message = "Player 2 wins" if board[0] == "o" && board[1] == "o" && board[2] == "o"
    puts @@message = "Player 1 wins" if board[3] == "x" && board[4] == "x" && board[5] == "x"
    puts @@message = "Player 2 wins" if board[3] == "o" && board[4] == "o" && board[5] == "o"
    puts @@message = "Player 1 wins" if board[6] == "x" && board[7] == "x" && board[8] == "x"
    puts @@message = "Player 2 wins" if board[6] == "o" && board[7] == "o" && board[8] == "o"
    puts @@message = "Player 1 wins" if board[0] == "x" && board[3] == "x" && board[6] == "x"
    puts @@message = "Player 2 wins" if board[0] == "o" && board[3] == "o" && board[6] == "o"
    puts @@message = "Player 1 wins" if board[1] == "x" && board[4] == "x" && board[7] == "x"
    puts @@message = "Player 2 wins" if board[1] == "o" && board[4] == "o" && board[7] == "o"
    puts @@message = "Player 1 wins" if board[2] == "x" && board[5] == "x" && board[8] == "x"
    puts @@message = "Player 2 wins" if board[2] == "o" && board[5] == "o" && board[8] == "o"
    puts @@message = "Player 1 wins" if board[0] == "x" && board[4] == "x" && board[8] == "x"
    puts @@message = "Player 2 wins" if board[0] == "o" && board[4] == "o" && board[8] == "o"
    puts @@message = "Player 1 wins" if board[2] == "x" && board[4] == "x" && board[6] == "x"
    puts @@message = "Player 2 wins" if board[2] == "o" && board[4] == "o" && board[6] == "o"
  end

end

ttt = Game.new
board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
ttt.show_board(board)
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
ttt.play_game(board)
