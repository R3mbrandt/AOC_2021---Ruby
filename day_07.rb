input = IO.readlines("input_day_07.txt")

### Part One
data=input.first.split(',').map(&:to_i)
fuel_costs=Hash.new(0)
(data.min..data.max).each do |pos|
	data.each do |crab_submarine|
		fuel_costs[pos]+=(crab_submarine-pos).abs
	end	
end	
p fuel_costs.values.min

### Part Two   ### Gaußche Summenformel

fuel_costs=Hash.new(0)
(data.min..data.max).each do |pos|
	data.each do |crab_submarine|
		steps = (crab_submarine-pos).abs
		fuel_costs[pos]+=0.5 * steps * (steps+1)
	end	
end	

p fuel_costs.values.min.to_i
