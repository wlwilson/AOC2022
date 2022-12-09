#!/usr/bin/ruby

#fname = 'input.test'
fname = 'input1'

total=0
max=Array.new()
File.foreach (fname) { |line| 
    puts "line is #{line}"
  if line!="\n"
    line=line.to_i
    total+=line
  else
    max.push(total)
    total=0
  end
}
max.push(total)
puts "maximum #{max}"
puts "sum #{max.sort.reverse.first(3).sum}"
