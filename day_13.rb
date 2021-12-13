require 'set'

input = IO.readlines("input_day_13.txt").map(&:strip)
points=input[0...input.find_index("")].map{|l| l.split(",").map(&:to_i).reverse}
inst=input[input.find_index("")+1..-1].map{|l| l.split.last}

### Part 1
inst.take(1).each do |i|
	ins,split_line=i.split("=")
	split_line=split_line.to_i
	case ins
	when "x"
		points.concat(points.select{|(y,x)| x>split_line}.map{|(y,x)| [y,split_line-(x-split_line)]}).delete_if{|(y,x)| x>split_line}.uniq!
	when "y"
		points.concat(points.select{|(y,x)| y>split_line}.map{|(y,x)| [split_line-(y-split_line),x]}).delete_if{|(y,x)| y>split_line}.uniq!
	end
end

p points.length

### Part Two
points=input[0...input.find_index("")].map{|l| l.split(",").map(&:to_i).reverse}

inst.each do |i|
	ins,split_line=i.split("=")
	split_line=split_line.to_i
	case ins
	when "x"
		points.concat(points.select{|(y,x)| x>split_line}.map{|(y,x)| [y,split_line-(x-split_line)]}).delete_if{|(y,x)| x>split_line}.uniq!
	when "y"
		points.concat(points.select{|(y,x)| y>split_line}.map{|(y,x)| [split_line-(y-split_line),x]}).delete_if{|(y,x)| y>split_line}.uniq!
	end
end

y_max=points.max_by{|(y,x)| y}[0]
x_max=points.max_by{|(y,x)| x}[1]

(-2..y_max+3).each do |y|
	puts ""
	(-2..x_max+3).each do |x|
		if points.include?([y,x]) 
			print "#"
		else
			print "."
		end
	end
end