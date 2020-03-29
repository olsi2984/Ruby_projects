def fibbs(n)
  puts "oops" if n < 0
  myArr = [0, 1]
  
  i = 2
  
  while i <= n
  
   sum = myArr[i-2].to_i + myArr[i-1].to_i
   myArr.push(sum)
   
   i = i + 1
  
  end
  
  print myArr[n]
  puts ""
  
end

fibbs(8)