require 'set'

input = IO.readlines("input_day_10.txt")
data=input.map{|l| l.strip.chars}
valid_pairs={'('=>')','['=>']','{'=>'}','<'=>'>'}

invalid_lines=Set.new

### Part One
invalid_brackets=[]
bracket_points={")"=>3,"]"=>57,"}"=>1197,">"=>25137}
data.each do |line|
	stack = []
	line.each do |c|
		if expectation = valid_pairs[c]
				stack << expectation
		else
			if stack.pop != c
				invalid_brackets << c
				invalid_lines<< line
				break
			end
		end
	end
end
sum=0
invalid_brackets.tally.each {|b,c| sum+=bracket_points[b]*c}
p sum

### Part Two
incomplete_lines = Set.new(data)-invalid_lines
bracket_points={")"=>1,"]"=>2,"}"=>3,">"=>4}
completion_sequences=[]
incomplete_lines.each do |line|
	stack = []
	ll=line.length
	line.each_with_index do |c,index|
		if expectation = valid_pairs[c]
				stack << expectation
		else
			if stack.pop != c
				p stack
				break
			end
		end
		completion_sequences<<stack.reverse if ll-1==index   ### last character read so end of sequence is reached
	end
end
scores=[]
completion_sequences.each do |seq|
	score=0
	seq.each{|b| score=score*5+bracket_points[b]}
	scores<<score
end
pp scores.sort[scores.length/2]