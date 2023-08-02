#!/usr/bin/env ruby

regex = /^h.n$/i

if ARGV.empty?
        puts "Usage: #{$PROGRAM_NAME} <string>"
        exit 1
end

input_string = ARGV[0]
if regex.match?(input_string)
	puts input_string
end
