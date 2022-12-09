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
  if line[2]=='X' #Lose
    total+=0
    case line[0]
    when 'A'
      total+=3
    when 'B'
      total+=1
    when 'C'
      total+=2
    end
  elsif line[2] == 'Y' #Draw
    total+=3
    case line[0]
    when 'A'
      total+=1
    when 'B'
      total+=2
    when 'C'
      total+=3
    end
  elsif line[2] == 'Z' #Win
    total+=6
    case line[0]
    when 'A'
      total+=2
    when 'B'
      total+=3
    when 'C'
      total+=1
    end
  end
    puts "You played #{line[2]} against #{line[0]} for #{total} points"
  gtotal+=total
end

puts "Score is #{gtotal}"


