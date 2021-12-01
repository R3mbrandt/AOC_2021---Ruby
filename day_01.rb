input = IO.readlines("input_day_01.txt")
data=input.map(&:to_i)

### Part One
inc=0
data[1..-1].each_with_index { |v,i| inc+=1 if data[i]<v }

puts "Part1: #{inc}"

### Part Two
inc=0
groups=[]
data.each_cons(3) {|a| groups<<a.reduce(&:+)}
groups[1..-1].each_with_index {|v,i| inc+=1 if groups[i]< v }

puts "Part2: #{inc}"