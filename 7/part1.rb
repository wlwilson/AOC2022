#!/usr/bin/ruby
require 'pry'
infile='test'
cmds=File.readlines(infile)

readingFiles=0
fs=Hash.new()
cwd=Array.new()


cmds.each do |cmd|
    case cmd
    when /^\$ cd (\S+)/
       if $1==".." then
          cwd.pop() 
          puts "cd up"
       else
          puts "cd to #{$1}"   
          cwd.push($1)  
       end
    when /^\$ cd ../
    when /^\$ ls/
       readingFiles=1
    when /(\d+) (\w+)/
        puts "file #{$2} has size #{$1}"
        file={$2=>$1}
        fs[cwd]=file
    when /dir (\w+)/
        puts "directory #{$1}"
        fs[cwd]=""
    else
        puts "unknown command #{cmd}"
    end
    puts "#{cwd}"
end

puts "#{fs}"
binding.pry()