class Mastermind

    attr_accessor :secret_code
    attr_accessor :feedback_arr
  
    def initialize
      @secret_code = [rand(1..6), rand(1..6), rand(1..6), rand(1..6)]
      print @secret_code
      @feedback_arr = ["x", "x", "x", "x"]
      play
    end
  
    def compare_codes(guess)
      guess_arr = guess.chars

      n = 0
      while n <= 3
        if guess_arr[n].to_i == @secret_code[n]
          feedback_arr[n] = "OK"
        elsif @secret_code.include?(guess[n])
          feedback_arr[n] = "*"
        else
          feedback_arr[n] = "X"
        end
        n += 1
      end

    end

    def play
      6.times do
        puts "Please type your guess (1-6)"
        guess = gets.chomp.to_s
        compare_codes(guess)
        puts "The result of your guess is: #{@feedback_arr}"
        return if @feedback_arr == ["OK", "OK", "OK", "OK"]
      end
    end
  
end
  
mstm = Mastermind.new
