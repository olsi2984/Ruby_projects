def fibbs_rec(n)
    puts "oops" if n < 0
    myArr = []
  
    if n == 0 || n == 1
      n
    else
      fibbs_rec(n-2) + fibbs_rec(n-1)
    end
end
  
p fibbs_rec(8)