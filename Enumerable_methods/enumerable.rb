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
    def my_select
        new_arr = []
        self.my_each do |n|
            if yield(n)
                new_arr.push(n)
            end
        end
        print new_arr
    end
    def my_all?
        self.my_each do |n|
            if !yield(n)
                return false
            end
        end
        return true
    end
    def my_any?
        self.my_each do |n|
            if yield(n)
                return true
            end
        end
        return false
    end
    def my_none?
        self.my_each do |n|
            if yield(n)
                return false
            end
        end
        return true
    end
    def my_count item = nil
        counter = 0
        if block_given?
            self.my_each do |n|
                if yield(n)
                    counter +=1
                end
            end
            return counter
        end
        if item
            self.my_each do |n|
                if n === item
                    counter +=1
                end
            end
            return counter
        else
            return self.length
        end
    end
    def my_map pr = nil
        map_arr = []
        self.my_each do |n|
            unless block_given?
                map_arr.push pr.call(n)
            else
                map_arr.push yield(n)
            end
        end
        return map_arr
    end
    def my_inject init = nil
        
        if init
            store_mem = init
            i = 0
        else
            store_mem = self.first
            i = 1
        end
        while i < self.length
            store_mem = yield(store_mem , self[i])
            i+=1
        end
        
        store_mem
    end
    
end
def multiply_els(elements)        
    result = elements.my_inject(1){|result, el| result * el}        
    puts result
end

res1 = [1,2,3,4,7].my_inject{ |result, el| result + el }
res2 = [1,2,5,6,2].my_inject(1){|result, el| result * el}
#res3 = ["ant", "bear", "cat"].my_map{|l| l = l + "y"}
puts ""
print res1
puts ""
print res2
puts ""
#print res3
#puts ""
multiply_els([1,2,5,6,2])