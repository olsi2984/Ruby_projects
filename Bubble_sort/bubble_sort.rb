def bubble_sort (init_arr)
    swaps = 0
    i = 0
    while i <= init_arr.length

        k = 0

        while k < init_arr.length - 1

            if init_arr[k] > init_arr[k+1]

                a = init_arr[k]
                b = init_arr[k+1]
                init_arr[k] = b
                init_arr[k+1] = a
                swaps +=1
            
            end

            k = k + 1

        end

        break if swaps === 0

        i = i+1

    end

    print init_arr

end

bubble_sort([4,3,78,2,0,2,123,9,11,5,29])

def bubble_sort_by (array)
    swaps = 0
    n = 0
    while n <= array.length

        k = 0
        while k < array.length - 1

            if yield(array[k], array[k+1]) > 0
                temp = array[k]
                array[k] = array[k+1]
                array[k+1] = temp
                swaps +=1
            end
            k += 1
        end
        
        n +=1
        break if swaps === 0
    end
    print array
end

bubble_sort_by(["hemoglobine","wrapped", "hi","hello","hey"]) do |left,right|
    left.length - right.length
end
