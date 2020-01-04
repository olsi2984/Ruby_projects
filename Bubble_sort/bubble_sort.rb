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

        i = i+1

    end

    print init_arr

end

bubble_sort([4,3,78,2,0,2])