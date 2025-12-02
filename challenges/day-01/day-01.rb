require_relative "../../utils/utils"

lines = read_challenge_lines("input.txt")

## Part 1
def rotate(position, direction, distance)
  if direction == "L"
    ((position - distance) % 100)
  else
    ((position + distance) % 100)
  end
end

position = 50
times_zero = 0

lines.each do |line|
  direction = line[0]
  distance  = line[1..].to_i

  position = rotate(position, direction, distance)

  times_zero += 1 if position.zero?
end

puts "Part 1 = Password: #{times_zero}"

## Part 2
def count_zeros_in_rotation(position, dir, steps)
  zeros = 0

  steps.times do
    position += dir == "R" ? 1 : -1
    position %= 100
    zeros += 1 if position == 0
  end

  [position, zeros]
end

position = 50
times_zero_2 = 0

lines.each do |line|
  dir = line[0]
  steps = line[1..].to_i

  position, z = count_zeros_in_rotation(position, dir, steps)
  times_zero_2 += z
end

puts "Part 2 = Password: #{times_zero_2}"
