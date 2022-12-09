#!/usr/bin/ruby
str=File.read('input').chomp
index=0
width=14

while str[index..index+width-1].split('').uniq.length!=width do index+=1 end

puts index+width