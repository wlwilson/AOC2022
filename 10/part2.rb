#!/usr/bin/ruby

cycle=1
x=1
strength=0
display=""

def printPixel (display, value, cycle)
  pos=display.length
  #puts "pp: #{cycle}"
  if (pos-value).abs<=1 then
    puts "Drawing pixel # in position #{pos}, cycle is #{cycle} sprite has value #{value}"
    #puts "######################################!!!!"
    return "#"
  else
    puts "Drawing pixel . in position #{pos}, cycle is #{cycle} sprite has value #{value}"
    return "."
  end
end

File.readlines('test').each do |ins|
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
end

display.split("").each_slice(40) do |sl|
    puts "#{sl.join}"
end

#I'm lazy: ./part1.rb | grep -e "Cycle 20," -e "Cycle 60," -e "le 100," -e "le 140," -e "le 180," -e "le 220," | awk '{ print $6 }' | paste -s -d"+" | bc