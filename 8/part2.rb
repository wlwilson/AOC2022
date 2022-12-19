#!/usr/bin/ruby
require 'pry'
trees=File.readlines('test').map { |line| line.split(/\n|/).map{ |e| e.to_i}}
score=Array.new(trees.length) {Array.new(trees[0].length, 0)}

def cnt_before_eqorgt(arr, val)
    count=0 
    binding.pry
    unless arr.length==0 then
        puts "Array length is #{arr.length} array at count is #{arr[count]} count is #{count} array is #{arr}"
        binding.pry
       while arr[count]<val && count < arr.length do
           count+=1
       end
    end
    return count
end

def find_score(map, i, j)
    val=map[i][j]
    horiz=map[i]
    vert=map.transpose[j]
    left=cnt_before_eqorgt(horiz[0,j],map[i][j])
    #right=cnt_before_eqorgt(horiz[j+1,horiz.length],map[i][j])
    #up=cnt_before_eqorgt(vert[0,i],map[i][j])
    #down=cnt_before_eqorgt(vert[i+1,vert.length],map[i][j])
    #score=left*right*up*down
    score=left
    return score
    #binding.pry
end

perimiterTress=(trees.length-1)*(trees[0].length-1)
trees.each_with_index do |arr, i|
    arr.each_with_index do |node, j|
        puts "### checking map at #{i},#{j}"
        score[i][j]=find_score(trees,i,j)
    end
end

for i in 0..trees.length() do
    puts "#{score[i]}"
end
for i in 0..trees.length() do
    puts "#{trees[i]}"
end

#puts "Sum is #{visible.map{|arr| arr.map{|e| e.to_i}.sum}.sum}"