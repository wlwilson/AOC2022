#!/usr/bin/ruby
require 'pry'
trees=File.readlines('input').map { |line| line.split(/\n|/).map{ |e| e.to_i}}
visible=Array.new(trees.length) {Array.new(trees[0].length, 0)}

#binding.pry

def is_visible(row, index)
    val=row[index].to_i
    left=row[0,index]
    right=row[index+1,row.length]
#    binding.pry
    if (val>left.map{|e| e.to_i}.max || val>right.map{|f| f.to_i}.max) then
        puts "val #{val} is visible in row #{row} at index #{index}"
        return 1
    else 
        return 0
    end
end

perimiterTress=(trees.length-1)*(trees[0].length-1)
trees.each_with_index do |arr, i|
    arr.each_with_index do |node, j|
        #puts "checking #{i} #{j} #{node}"
        if i==0 || i==trees.length-1 || j==0 || j==trees[0].length-1 then
            visible[i][j]=1
        else
            puts "## i=#{i} j=#{j} val=#{trees[i][j]}"
            #puts "row is #{trees[i]}"
            if is_visible(trees[i],j)==1 then
                visible[i][j]=1
            elsif is_visible(trees.transpose[j],i)==1 then
                visible[i][j]=1
            end
        end
    end
end

    
#binding.pry
for i in 0..trees.length() do
    puts "#{visible[i]}"
end
for i in 0..trees.length() do
    puts "#{trees[i]}"
end


puts "Sum is #{visible.map{|arr| arr.map{|e| e.to_i}.sum}.sum}"