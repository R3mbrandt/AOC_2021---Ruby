require 'set'

input = IO.readlines("input_day_09.txt")

data=input.map{|l| l.strip.chars.map(&:to_i)}
max_x=data[0].length
max_y=data.length
low_points={}

### Part One
(0...max_y).each do |y|
	(0...max_x).each do |x|
		point_val=data[y][x]
		point_right=x+1 < max_x ? data[y][x+1] : 99 
		point_left=x-1 >=0 ? data[y][x-1]: 99 
		point_down= y+1 <max_y ? data[y+1][x]: 99 
		point_up= y-1 >=0 ? data[y-1][x] : 99 
		low_points[[y,x]]=point_val if point_val < [point_right,point_left,point_down,point_up].min
	end
end
p low_points.values.map(&:succ).sum

#Part Two
cur_id=1
ids=Array.new(max_y){Array.new(max_x,0)}

low_points.keys.each do |y,x|
	stack=[[y,x]]
	visited=Set.new()
	while stack.length>0 do
		y,x = stack.pop
		next if visited.include?([y,x])
		visited << [y,x]
		ids[y][x]=cur_id
		[[0, 1], [0, -1], [-1, 0], [1, 0]].each do |dy,dx|
			rr = y + dy
			cc = x + dx
			next if not ((0 <= rr and rr < max_y) and (0 <= cc and cc < max_x))
			next if data[rr][cc]==9
			stack << [rr,cc]
		end
	end
	cur_id+=1
end

p ids.flatten.tally.delete_if{|k,v| k ==0}.values.sort.reverse[0..2].reduce(:*)




