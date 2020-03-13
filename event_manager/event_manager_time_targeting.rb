require "csv"
require "date"

puts "EventManager initialized."

hour_arr = []

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
contents.each do |row|
  name = row[:first_name]
  last_name = row[:last_name]
  regdate = row[:regdate]
  hours = DateTime.strptime(regdate, "%m/%d/%Y %H:%M").hour
  hour_arr.push(hours)
  #puts "#{name} #{last_name} #{regdate} hour: #{hours}"

end

#print hour_arr
hour_count = hour_arr.inject(Hash.new(0)) { |total, e| total[e] += 1 ;total}
#puts ""
sorted = hour_count.sort_by { |k,v| v }.to_h
puts "Most used hours for registration are:"
n = sorted.values.last
sorted.each do |k, v|
  if v == n
    puts k
  end
end
