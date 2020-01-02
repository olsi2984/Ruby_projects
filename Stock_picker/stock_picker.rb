def stock_picker (stocks)
    sell_day = 0
    buy_day = 0
    current_profit = 0
    max_profit = 0
    stocks.each_with_index do |stock, index|
        buy_price = stock
        n = index
        
        while n < stocks.length 
            sell_price = stocks[n]
            current_profit = sell_price - buy_price
            n += 1 

            if current_profit > max_profit
                max_profit = current_profit
                buy_day = stocks.index(buy_price)
                sell_day = n - 1
            end      
        end        
        
    end
    
    puts "You should buy on day #{buy_day} and sell on day #{sell_day}, the profit will be #{max_profit}"
    
end

stocks = [17,3,6,9,15,8,6,1,10]
stock_picker(stocks)

