#!/usr/bin/env ruby

if ARGV.empty?
	puts "Usage: #{$PROGRAM_NAME} <log_file>"
	exit 1
end

log_file_path = ARGV[0]

file.open(log_file_path, "r").each_line do |line|
	parts = line.strip.split(',')
	sender = parts[0]
	receiver = parts[1]
	flags = parts[2]
	puts "#{sender},#{receiver},#{flags}"
end
