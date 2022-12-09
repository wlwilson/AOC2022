#!/usr/bin/ruby
total=0
File.readlines('input').each do |ts|
  ts=ts.chomp  
  s1=ts[0..ts.length/2-1].scan /\w/
  s2=ts[ts.length/2..ts.length].scan /\w/
  common = s1 & s2
  #puts "#{s1} #{s2}"
  puts "common #{common}"
  common=common[0]
  if common==common.upcase then
    total += common.sum-38
  elsif common==common.downcase then
    total += common.sum-96
  else
    puts "not sure if #{common} is upper or lower case"
  end
end
puts "sum is #{total}"