part1 = File.read("input/input.txt").split("\n\n").map{ |a| a.split("\n").map(&:to_i).sum}.max
part2 = File.read("input/input.txt").split("\n\n").map{ |a| a.split("\n").map(&:to_i).sum}.sort[-3..-1].sum
puts "Part1: #{part1}"
puts "Part2: #{part2}"
