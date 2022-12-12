#!/usr/bin/ruby
require 'pry'

cycle=1
x=1
strength=0
display=""

def printPixel (display, value, cycle)
  pos=display.length
  #puts "pp: #{cycle}"
  if ((pos%40)-value).abs<=1 then
    puts "Drawing pixel # in position #{pos}, cycle is #{cycle} sprite has value #{value}"
    #puts "######################################!!!!"
    return "#"
  else
    puts "Drawing pixel . in position #{pos}, cycle is #{cycle} sprite has value #{value}"
    return "."
  end
end

File.readlines('input').each do |ins|
    #puts "Start cycle #{cycle}, drawing pixel in position #{display.length} X: #{x}, Strength: #{cycle*x}"
    #puts "instruction #{ins}"
    case ins
    when /noop/
        display+=printPixel(display,x,cycle)
        cycle+=1
    when /addx (-?\d+)/
        puts "Adding #{$1}"
        display+=printPixel(display,x,cycle)
        cycle+=1
        #puts "Cycle #{cycle}, X: #{x}, Strength: #{cycle*x}"
        display+=printPixel(display,x,cycle)
        cycle+=1
        #puts "Cycle #{cycle}, X: #{x}, Strength: #{cycle*x}"
        x+=$1.to_i
        puts "pos: #{x}"
    end
    #binding.pry
end

display.split("").each_slice(40) do |sl|
    puts "#{sl.join}"
end
