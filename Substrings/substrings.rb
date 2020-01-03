def substrings (string, dictionary)
    string = string.downcase.split
    words = Hash.new(0)

    string.each do |string|

        dictionary.each do |ref|

            if string.include?(ref)
                words[ref] += 1
            end

        end
    end

    puts words
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
substrings("below", dictionary)
substrings("Howdy partner, sit down! How's it going?", dictionary)