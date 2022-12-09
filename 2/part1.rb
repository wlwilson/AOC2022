#!/usr/bin/ruby
#A=1
#B=2
#C=3
#
#A=X=Rock
#B=Y=Paper
#C=Z=Scissors
#
#Win=6
#Draw=3
#Loss=0

gtotal=0

#File.readlines('test').each do |line|
File.readlines('input').each do |line|
  total=0
  round=line.split
  if line[2]=='X'
    total+=1
    case line[0]
    when 'A'
      total+=3
    when 'B'
      total+=0
    when 'C'
      total+=6
    end
  elsif line[2] == 'Y'
   total+=2
    case line[0]
    when 'A'
      total+=6
    when 'B'
      total+=3
    when 'C'
      total+=0
    end
  elsif line[2] == 'Z'
  total+=3
    case line[0]
    when 'A'
      total+=0
    when 'B'
      total+=6
    when 'C'
      total+=3
    end
  end
    puts "You played #{line[2]} against #{line[0]} for #{total} points"
  gtotal+=total
end

puts "Score is #{gtotal}"


