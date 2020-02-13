class Mastermind

    attr_accessor :secret_code, :feedback_arr
  
    def initialize
      @secret_code = [rand(1..6), rand(1..6), rand(1..6), rand(1..6)]
      @feedback_arr = ["x", "x", "x", "x"]
      game_rules
      play
    end

    def game_rules
      puts "Welcome to mastermind"
      puts "You have 6 tries to guess the right code"
      puts "After each guess, you will get the repective feedback"
      puts "'x' means that the number is not included in the secret code"
      puts "'*' means that the number is included in the secret code, but not in the correct position"
      puts "'OK' means that you guessed the right number, in the correct position"
      puts "Let's play!"
    end

    def valid_move?(guess)

      guess.split("").each do |g|
        if g.to_i.between?(1, 6) == false
          puts "Please type a valid input (a 4 digit code of 1-6 numbers)"
          false
        end
      end

      if guess.length > 4
        puts "Your code is to long"
        false
      end

    end

    def code_creator

      puts "Please type your 4 digit (1-6) secret code"
      @secret_code = []
      secret = gets.chomp

      secret.split("").each do |s|
        @secret_code.push(s.to_i)
      end
      
      6.times do
      guess = [rand(1..6), rand(1..6), rand(1..6), rand(1..6)].join
      compare_codes(guess)
      puts "The result of computer's guess is: #{@feedback_arr}"
        if @feedback_arr == ["OK", "OK", "OK", "OK"]
          puts "Computer guessed your secret code!"
          return
        end
      end

      game_end

    end
  
    def compare_codes(guess)

      guess_arr = guess.chars
      valid_move?(guess)
      n = 0
      while n <= 3
        if guess_arr[n].to_i == @secret_code[n]
          feedback_arr[n] = "OK"
        elsif @secret_code.include?(guess[n].to_i)
          feedback_arr[n] = "*"
        else
          feedback_arr[n] = "X"
        end
        n += 1
      end

    end

    def guesser
      6.times do
        puts "Please type your guess (1-6)"
        guess = gets.chomp.to_s
        compare_codes(guess)
        puts "The result of your guess is: #{@feedback_arr}"
        if @feedback_arr == ["OK", "OK", "OK", "OK"]
          puts "Congratulations!"
          return
        end
      end
      game_end
    end

    def play
      puts "Would you like to be the guesser or the creator of the secret code?"
      puts "Please type 'guesser', or 'creator'"
      game_mode = gets.chomp
      if game_mode == 'guesser'
        guesser
      elsif game_mode == 'creator'
        code_creator
      else
        puts "Wrong input"        
      end
    end

    def game_end
      puts "The secret code was not discovered in this game"
      puts "For information, the secret code was: #{@secret_code}"
    end
  
end
  
mstm = Mastermind.new
