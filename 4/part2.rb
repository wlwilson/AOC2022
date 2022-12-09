#!/usr/bin/ruby
total=0
File.readlines('input').each do |ts|
  arr=ts.split(/-|,|\n/).map{|num| num.to_i}
  if (arr[1]>=arr[2] && arr[3]>=arr[0]) || (arr[3]>=arr[0] && arr[1]>=arr[2]) then
    total+=1
  end
end
puts "sum is #{total}"