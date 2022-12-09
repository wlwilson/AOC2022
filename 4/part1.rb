#!/usr/bin/ruby
total=0
File.readlines('input').each do |ts|
  arr=ts.split(/-|,|\n/).map{|num| num.to_i}
  if (arr[0]<=arr[2] && arr[1]>=arr[3]) then
  #  puts " . #{arr}"
    total+=1
  elsif (arr[0]>=arr[2] && arr[1]<=arr[3]) then
    puts " . #{arr}"
    total+=1
  else
    puts " x #{arr}"
  end
end
puts "sum is #{total}"