#!/usr/bin/ruby
require 'pry'
#trees=File.readlines('test').map { |line| line.split(/\n|/).map{ |e| e.to_i}}
trees=File.readlines('input').map { |line| line.split(/\n|/).map{ |e| e.to_i}}
score=Array.new(trees.length) {Array.new(trees[0].length, 0)}

def cnt_before_eqorgt(arr, val)
    count=0 
    unless arr.length==0 then
        #puts "Array length=#{arr.length} array@count=#{arr[count]} count=#{count} array=#{arr}"
        #binding.pry
        #while count < arr.length && arr[count]<val do
        arr.each do |tree|
            count+=1
            if tree>=val then
                break
            end
        end
    end
    return count
end

def find_score(map, i, j)
    val=map[i][j]
    horiz=map[i]
    vert=map.transpose[j]
    up=cnt_before_eqorgt(vert[0,i].reverse,map[i][j])
    #puts "Look up - score is #{up}"
    left=cnt_before_eqorgt(horiz[0,j].reverse,map[i][j])
    #puts "Look left - score is #{left}"
    right=cnt_before_eqorgt(horiz[j+1,horiz.length],map[i][j])
    #puts "Look right - score is #{right}"
    down=cnt_before_eqorgt(vert[i+1,vert.length],map[i][j])
    #puts "Look down - score is #{down}"
    score=left*right*up*down
    #puts "Total score is #{score}"
    return score
end

perimiterTress=(trees.length-1)*(trees[0].length-1)
trees.each_with_index do |arr, i|
    arr.each_with_index do |node, j|
        #puts "### checking map at #{i},#{j}"
        score[i][j]=find_score(trees,i,j)
    end
end

#for i in 0..trees.length() do
#    puts "#{trees[i]}"
#end
#for i in 0..trees.length() do
#    puts "#{score[i]}"
#end

puts "Max Score is #{score.map{|row| row.max}.max}"
#puts "Sum is #{visible.map{|arr| arr.map{|e| e.to_i}.sum}.sum}"