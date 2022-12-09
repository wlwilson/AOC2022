#!/usr/bin/ruby
total=0
#File.readlines('input').each_slice(3) do |s1, s2, s3|
File.readlines('test').each_slice(3) do |s1, s2, s3|
  s1=s1.scan /\w/
  s2=s2.scan /\w/
  s3=s3.scan /\w/
  common = s1 & s2 & s3
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