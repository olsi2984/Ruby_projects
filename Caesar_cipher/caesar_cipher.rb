def caesar_cipher (string, key)
    solution = ""
    if key > 0
        key += 0
    else
        key += 26
    end

    string.split("").each do |i|
        asci = string[i].ord
        if asci >= 65 && asci <= 90
            asci = ((asci-65 + key) % 26)+65
            solution += asci.chr
        elsif asci >= 97 && asci <= 122
            asci = ((asci-97 + key) % 26)+97
            solution += asci.chr
        else
            solution += string[i]
        end
    end

    puts solution
end

caesar_cipher("What a string!", 5)

