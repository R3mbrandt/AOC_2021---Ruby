input = IO.readlines("input_day_02.txt")

hor=0
depth=0

data=input.map(&:split)

### Part 1
data.each do |inst|
	case inst[0]
	when "forward"
		hor+=inst[1].to_i
	when "down"
		depth+=inst[1].to_i
	when "up"
		depth-=inst[1].to_i
	end
end

puts "Part 1: #{hor*depth}"

### Part 2
hor=0
depth=0
aim=0

data.each do |inst|
	case inst[0]
	when "forward"
		hor+=inst[1].to_i
		depth+=inst[1].to_i*aim
	when "down"
		aim+=inst[1].to_i
	when "up"
		aim-=inst[1].to_i
	end
end

puts "Part 2: #{hor*depth}"