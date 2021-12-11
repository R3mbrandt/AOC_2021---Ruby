input = IO.readlines("input_day_11.txt")
data=input.map{|l| l.strip.chars.map(&:to_i)}
####### left  right   up    down leftup leftdown rup   rdown
moves=[[0,-1],[0,1],[-1,0],[1,0],[-1,-1],[1,-1],[-1,1],[1,1]]
y_max=data.length
x_max=data[0].length

### Part One
flashes=0
(1..100).each do
	### Add one to every octopus
	data.map!{|l| l.map!(&:succ)}
	while data.flatten.any?{|o| o>9} do
		(0...y_max).each do |y|
			(0...x_max).each do |x|
				if data[y][x] > 9 then
					data[y][x]=0   ### flash
					flashes+=1
					moves.each do |yy,xx|
						dy=y+yy
						dx=x+xx
						if 0<=dx and dx<x_max and 0<=dy and dy<y_max and data[dy][dx]!=0 then
							data[dy][dx]+=1
						end
					end
				end 
			end
		end
	end
end
pp flashes

### Part Two
data=input.map{|l| l.strip.chars.map(&:to_i)}
step=0
(1..1000).each do
	### Add one to every octopus
	step+=1
	data.map!{|l| l.map!(&:succ)}
	while data.flatten.any?{|o| o>9} do
		(0...y_max).each do |y|
			(0...x_max).each do |x|
				if data[y][x] > 9 then
					data[y][x]=0   ### flash
					flashes+=1
					moves.each do |yy,xx|
						dy=y+yy
						dx=x+xx
						if 0<=dx and dx<x_max and 0<=dy and dy<y_max and data[dy][dx]!=0 then
							data[dy][dx]+=1
						end
					end
				end 
			end
		end
	end
	break if data.flatten.all?{|o| o==0}
end

pp step
