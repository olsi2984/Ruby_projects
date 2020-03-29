require "csv"
require "date"

puts "EventManager initialized."

day_arr = []

contents = CSV.open "event_attendees.csv", headers: true, header_converters: :symbol

contents.each do |row|
  name = row[:first_name]
  last_name = row[:last_name]
  regdate = row[:regdate]
  day = DateTime.strptime(regdate, "%m/%d/%Y %H:%M")
  weekday = Date.parse(day.to_s).strftime("%A")
  day_arr.push(weekday)
end

#print day_arr

day_count = day_arr.inject(Hash.new(0)) { |total, e| total[e] += 1 ;total}
sorted = day_count.sort_by { |k,v| v }.to_h
puts "Most used week days for registration are:"
n = sorted.values.last
sorted.each do |k, v|
  if v == n
    puts k
  end
end

