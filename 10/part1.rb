#!/usr/bin/ruby

cycle=1
x=1
strength=0
File.readlines('input').each do |ins|
    puts "Cycle #{cycle}, X: #{x}, Strength: #{cycle*x}"
    puts "instruction #{ins}"
    case ins
    when /noop/
        cycle+=1
    when /addx (-?\d+)/
        puts "Adding #{$1}"
        cycle+=1
        puts "Cycle #{cycle}, X: #{x}, Strength: #{cycle*x}"
        cycle+=1
        #puts "Cycle #{cycle}, X: #{x}, Strength: #{cycle*x}"
        x+=$1.to_i
    end
end
#I'm lazy: ./part1.rb | grep -e "Cycle 20," -e "Cycle 60," -e "le 100," -e "le 140," -e "le 180," -e "le 220," | awk '{ print $6 }' | paste -s -d"+" | bc