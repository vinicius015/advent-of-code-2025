require_relative "../../utils/utils"

input = read_challenge_input("input.txt")

ranges = input.split(",")
id_sum_part_1 = 0
id_sum_part_2 = 0

ranges.each do |range|
  min, max = range.split("-").map(&:to_i)
  
  for i in min..max do
    id = i.to_s
    
      if id =~ /^(\d+)\1$/
        id_sum_part_1 += id.to_i
      end

      if id =~ /^(\d+)\1+$/
        id_sum_part_2 += id.to_i
      end
  end
end

puts "Part 1 - Id Sum: #{id_sum_part_1}"
puts "Part 2 - Id Sum: #{id_sum_part_2}"