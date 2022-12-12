#!/usr/bin/ruby
require 'pry'
infile='test'
cmds=File.readlines(infile)

readingFiles=0
fs=Array.new()
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
          puts "pwd is #{cwd}"
          dir=Array[$1]
          puts "dir is #{dir}"
          fs[cwd].push(dir)
       end
    when /^\$ cd ../
    when /^\$ ls/
       readingFiles=1
    when /(\d+) (\w+)/
        puts "file #{$2} has size #{$1}"
        puts "Currently fs is #{fs}"
        file={$2=>$1}
        fs[cwd].push(file)
        puts "Adding file #{$2} with size #{$1}"
    when /dir (\w+)/
        puts "directory #{$1}"
        #fs[cwd]=$1
    else
        puts "unknown command #{cmd}"
    end
    puts "cwd: #{cwd}"
end

puts "#{fs}"
#binding.pry()