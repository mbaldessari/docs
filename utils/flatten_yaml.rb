require 'yaml'

if ARGV.length != 1
  puts "Please run: #{$0} <metadata-file.yaml>"
  exit(1)
end
# Function to flatten a nested hash
def flatten_hash(hash, prefix = "")
  flat_hash = {}
  hash.each do |key, value|
    new_key = prefix.empty? ? key.to_s : "#{prefix}_#{key}"
    if value.is_a?(Hash)
      flat_hash.merge!(flatten_hash(value, new_key))
    else
      flat_hash[new_key] = value
    end
  end
  flat_hash
end

# Function to read, parse, and flatten the YAML file
def process_yaml(file_path)
  begin
    # Load and parse the YAML file
    yaml_data = YAML.load_file(file_path)

    # Flatten the YAML structure
    flat_data = flatten_hash(yaml_data)

    # Print each key-value pair
    flat_data.each do |key, value|
      puts "#{key}: #{value}"
    end
  rescue Errno::ENOENT
    puts "Error: File not found at '#{file_path}'. Please provide a valid file path."
  rescue Psych::SyntaxError => e
    puts "Error: Syntax error in YAML file. Details:"
    puts e.message
  end
end

process_yaml(ARGV[0])
