# frozen_string_literal: true

# Helper to prepare strings with spaces for URLs
def replace_space_with_escape(text)
  text.gsub(' ', '%20')
end

# Helper to write pretty JSON to disk
def write_pretty_json(filename, data)
  File.open("data/#{filename}", 'w') do |f|
    f.write(JSON.pretty_generate(data))
  end
end

# Write data given to pretty JSON output
def display_pretty_json(data)
  puts JSON.pretty_generate(data)
end
