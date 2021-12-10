input = IO.readlines("input_day_06.txt")

data=input.first.split(',').map(&:to_i)

#p data
(1..256).each do |day|
	new_fishes=[]
	data.map! do |f|
		case f
		when 0
			new_fishes<<8
			f=6
		else
			f-=1
		end
	end
	data.concat(new_fishes) if new_fishes != []
	#p "Day: #{day} #{data}"
end	
p data.count
