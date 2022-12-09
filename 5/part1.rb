#!/usr/bin/ruby
require 'pry'
total=0
stacks=Hash.new
#File.read('test').split("\n\n")[0].split("\n").map{|line| line.split("")}.transpose.each_slice(4) do |col|
File.read('input').split("\n\n")[0].split("\n").map{|line| line.split("")}.transpose.each_slice(4) do |col|
  index = col[1].reverse[0]
  data = col[1].reverse.last(col[1].length-1).map { |char| char.split(" ")[0]}.compact
  stacks[index]=data
end

puts "#{stacks}"

File.read('input').split("\n\n")[1].split("\n").each do |move|
  cmd=move.split(/move | from | to | /)
  vals=stacks[cmd[2]].pop(cmd[1].to_i)
  #part1
  #stacks[cmd[3]].concat(vals.reverse)
  #part2
  stacks[cmd[3]].concat(vals)
end
puts "#{stacks}"
final=""
stacks.each do |k,v|
  final.concat(v.last())
end
puts "#{final}"