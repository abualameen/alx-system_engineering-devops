#!/usr/bin/env ruby

regex = /\[from:(.*?)\] \[to:(.*?)\] \[flags:(.*?)\]/

if ARGV.empty?
	puts "Usage: #{$PROGRAM_NAME} '<log_line>'"
	exit 1
end

log_line = ARGV[0]

match_data = log_line.match(regex)

sender = match_data[1]
receiver = match_data[2]
flags = match_data[3]

puts "#{sender},#{receiver},#{flags}"
