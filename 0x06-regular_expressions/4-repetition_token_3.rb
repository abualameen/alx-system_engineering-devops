#!/usr/bin/env ruby

regex = /\bSchool\b/i

if ARGV.empty?
        puts "Usage: #{$PROGRAM_NAME} <string>"
        exit 1
end

input_string = ARGV[0]

matches = input_string.scan(regex)

puts matches.join
