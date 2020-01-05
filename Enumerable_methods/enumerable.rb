module Enumerable
    def my_each
        i = 0
        while i < self.length
            yield self[i]
            i +=1
        end
    end

    def my_each_with_index
        i = 0
        while i < self.length
            yield(self[i], i)
            i +=1
        end
    end
    
end

([1,2,3,7]).each_with_index do |n, index|
    stringer = index.to_s + "." + n.to_s
    puts stringer
end