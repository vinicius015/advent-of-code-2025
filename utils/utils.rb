def read_challenge_input(file_path)
  begin
    File.read(file_path, encoding: "UTF-8")
  rescue => e
    puts "Failed to read file: #{e.message}"
    ""
  end
end

def read_challenge_lines(file_path)
  begin
    File.readlines(file_path, chomp: true, encoding: "UTF-8")
  rescue => e
    puts "Failed to read file: #{e.message}"
    []
  end
end
