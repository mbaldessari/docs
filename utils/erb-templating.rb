require 'erb'
require 'yaml'

if ARGV.length != 2
  puts "Please run: #{$0} <metadata-file.yaml> <erb-template>"
  exit(1)
end

begin
  metadata = YAML.load_file(ARGV[0])
rescue Errno::ENOENT
  puts "Error: #{ARGV[0]} not found"
  exit(1)
rescue Psych::SyntaxError => e
  puts "YAML syntax error: #{e.message}"
  exit(1)
end

begin
  template = File.read(ARGV[1])
rescue Errno::ENOENT
  puts "Error: #{ARGV[1]} not found"
  exit(1)
rescue => e
  puts "Error: #{e.message}"
  exit(1)
end

requirements = metadata['requirements']
renderer = ERB.new(template)
output = renderer.result(binding)
puts output
