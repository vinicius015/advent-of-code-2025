require_relative "../../utils/utils"
require 'set'

lines = read_challenge_lines("input.txt")

fresh_ingredients_ranges_lines = lines.select { |line| line.include?("-") && !line.empty? }
fresh_ingredients_ranges = []

available_ingredients = lines.select { |line| !line.include?("-") && !line.empty? }
total_available_fresh_ingredients = 0

total_fresh_ingredients_in_ranges = 0

fresh_ingredients_ranges_lines.each do |range_line|
  range_start, range_end = range_line.split("-").map(&:to_i)
  
  fresh_ingredients_ranges << (range_start..range_end)
end

available_ingredients.each do |ingredient_line|
  ingredient = ingredient_line.to_i
  
  if fresh_ingredients_ranges.any? { |range| range.cover?(ingredient) } 
    total_available_fresh_ingredients += 1
  end
end

merged_ranges = []

fresh_ingredients_ranges
  .sort_by { |r| r.begin }
  .each do |range|
    if merged_ranges.empty? || range.begin > merged_ranges.last.end + 1
      merged_ranges << (range.begin..range.end)
    else
      last = merged_ranges.pop
      merged_ranges << (last.begin..[last.end, range.end].max)
    end
  end

total_fresh_ingredients_in_ranges = merged_ranges.sum { |r| r.size }


puts "Part 1 - Total available fresh ingredients: #{total_available_fresh_ingredients}"
puts "Part 2 - Total fresh ingredients in ranges: #{total_fresh_ingredients_in_ranges}"