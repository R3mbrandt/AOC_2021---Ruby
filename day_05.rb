input = IO.readlines("input_day_05.txt")

### Part One
field=Hash.new(0)
input.each do |line|
	start,ende=line.split(' -> ').map(&:strip)
	start=start.split(',').map(&:to_i)
	ende=ende.split(',').map(&:to_i)
	if start[0]!=ende[0] and start[1]!=ende[1] 
		next
	end
	x1,y1=start
	x2,y2=ende
	if x1>x2 then x1,x2=x2,x1 end
	if y1>y2 then y1,y2=y2,y1 end
	(x1..x2).each do |x|
		(y1..y2).each do |y|
			field[[x,y]]+=1
		end
	end
end
p field.select{|k,v| v>=2}.count

### Part Two ### Steigung ausrechnen! 
input.each do |line|
	start,ende=line.split(' -> ').map(&:strip)
	start=start.split(',').map(&:to_i)
	ende=ende.split(',').map(&:to_i)
	if ((ende[0]-start[0]).abs == (ende[1]-start[1]).abs)  ### nur Diagonal Linien!
		x1,y1=start
		x2,y2=ende
		xa,xb = [x1,x2].sort
		dx = x1 > x2 ? -1 : 1
		dy = y1 > y2 ? -1 : 1
		x,y=x1,y1
		(xa..xb).each do
			field[[x,y]]+=1
			x+=dx
			y+=dy
		end
	end
end
p field.select{|k,v| v>1}.count