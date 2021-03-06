class Game
  
  @@message = "It's a tie" # updated from check_winner
  
  def initalize(board)
    @board = board
  end

  def show_board(board)
    puts row1 = "#{board[0]}"" | ""#{board[1]}"" | ""#{board[2]}"
    puts separator = "---------"
    puts row2 = "#{board[3]}"" | ""#{board[4]}"" | ""#{board[5]}"
    puts separator
    puts row3 = "#{board[6]}"" | ""#{board[7]}"" | ""#{board[8]}"
  end

  def valid_move?(board, p)
    if p.between?(1, 9) == false
      puts "Please type a valid input"
      false
    elsif board[p-1] != " "
      puts "Sorry that cell is taken"
      false
    else
      true
    end
  end

  def taken_cells(board)
    taken = 0
    board.each do |n|
      if n == "x" || n == "o"
        taken +=1
      end
    end
    return taken
  end

  def current_player(board)
    player = nil
    if taken_cells(board) % 2 == 0
      player = "Player 1"
    else
      player = "Player 2"
    end
    return player
  end

  def put_mark(board, p)
    if current_player(board) === "Player 1"
      board[p-1] = "x"
    else
      board[p-1] = "o"
    end
  end

  def position
    p = nil
  end

  def turn(board)
    puts "#{current_player(board)} please type a number from 1 to 9 where do you want to put your mark"
      p = gets.chomp.to_i
      if valid_move?(board, p)
        put_mark(board, p)
        show_board(board)
      else
        turn(board)
      end
  end
  
  def play_game(board) 

    until
      taken_cells(board) == 9
      turn(board)
      check_winner(board)
      return if @@message == "Player 1 wins" || @@message == "Player 2 wins"
    end
    puts @@message
    
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
