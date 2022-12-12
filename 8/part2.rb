#!/usr/bin/ruby
require 'pry'
trees=File.readlines('test').map { |line| line.split(/\n|/).map{ |e| e.to_i}}
score=Array.new(trees.length) {Array.new(trees[0].length, 0)}

def find_score(map, i, j)
    val=map[i][j]
end

perimiterTress=(trees.length-1)*(trees[0].length-1)
trees.each_with_index do |arr, i|
    arr.each_with_index do |node, j|
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