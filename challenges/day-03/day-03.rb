require_relative "../../utils/utils"

banks = read_challenge_lines("input.txt")

# Part 1
total_joltage_output = 0
batteries_sum = 0

banks.each do |bank|
  highest_number = 0
  highest_number_index = 0
    for i in 0..bank.length do
      if bank[i].to_i > highest_number && i != (bank.length - 1)
        highest_number = bank[i].to_i
        highest_number_index = i
      end
    end

    other_highest_number = 0
    for i in (highest_number_index + 1)..bank.length do
      if bank[i].to_i > other_highest_number
        other_highest_number = bank[i].to_i
      end
    end
    total_joltage_output += ("#{highest_number.to_s}#{other_highest_number.to_s}").to_i
end

puts "Part 1 - Total Joltage Output: #{total_joltage_output}"

# Part 2
total_joltage_output = 0

banks.each do |bank|
  joltage = ""
  remaining_batteries = bank.length

  bank.chars.each do |char|
    while !joltage.empty? &&
          joltage[-1].to_i < char.to_i &&
          (joltage.length - 1 + remaining_batteries) >= 12
      joltage.chop!
    end

    if joltage.length < 12
      joltage << char
    end

    remaining_batteries -= 1
  end

  joltage = joltage[0, 12]
  total_joltage_output += joltage.to_i
end


puts "Part 2 - Total Joltage Output: #{total_joltage_output}"