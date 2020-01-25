module GameValidations
  #Allow only 1-9 numbers
  #Doesn't allow overwriting cell value"
end

class Game
  
  #include GameValidations

  @@message = "It's a tie"

  def initalize(board, tot_counter, message)
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

  def check_winner(board)
    
    if board[0] == "x" && board[1] == "x" && board[2] == "x"
        puts @@message = "Player 1 wins"
      elsif board[0] == "o" && board[1] == "o" && board[2] == "o"
        puts @@message = "Player 2 wins"
      elsif board[3] == "x" && board[4] == "x" && board[5] == "x"
        puts @@message = "Player 1 wins"
      elsif board[3] == "o" && board[4] == "o" && board[5] == "o"
        puts @@message = "Player 2 wins"
      elsif board[6] == "x" && board[7] == "x" && board[8] == "x"
        puts @@message = "Player 1 wins"
      elsif board[6] == "o" && board[7] == "o" && board[8] == "o"
        puts @@message = "Player 2 wins"
      elsif board[0] == "x" && board[3] == "x" && board[6] == "x"
        puts @@message = "Player 1 wins"
      elsif board[0] == "o" && board[3] == "o" && board[6] == "o"
        puts @@message = "Player 2 wins"
      elsif board[1] == "x" && board[4] == "x" && board[7] == "x"
        puts @@message = "Player 1 wins"
      elsif board[1] == "o" && board[4] == "o" && board[7] == "o"
        puts @@message = "Player 2 wins"
      elsif board[2] == "x" && board[5] == "x" && board[8] == "x"
        puts @@message = "Player 1 wins"
      elsif board[2] == "o" && board[5] == "o" && board[8] == "o"
        puts @@message = "Player 2 wins"
      elsif board[0] == "x" && board[4] == "x" && board[8] == "x"
        puts @@message = "Player 1 wins"
      elsif board[0] == "o" && board[4] == "o" && board[8] == "o"
        puts @@message = "Player 2 wins"
      elsif board[2] == "x" && board[4] == "x" && board[6] == "x"
        puts @@message = "Player 1 wins"
      elsif board[2] == "o" && board[4] == "o" && board[6] == "o"
        puts @@message = "Player 2 wins"
      else
        @@message = "It's a tie"
    end
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

end


ttt = Game.new
board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
ttt.show_board(board)
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
ttt.play_game(board)
