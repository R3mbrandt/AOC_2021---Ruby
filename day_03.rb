input = IO.readlines("input_day_03.txt")
data=input.map(&:split).map{|l| l[0].split('').map(&:to_i)}

### Part One
gamma=[]
epsilon=[]

data.transpose.each do |l|
	if l.count(0) > l.count(1)
		gamma<<0
		epsilon<<1
	else
		gamma<<1
		epsilon<<0
	end
end

p gamma.join.to_i(2)*epsilon.join.to_i(2)

### Part Two

oxygen=[]
co2=[]
pos=0

#p data.transpose[0].max_by{|i| data.transpose[0].count(i)}

org_data=Marshal.load(Marshal.dump(data))

while data.length > 1 do 
	l=data.transpose[pos]
	max=1
	if l.count(1)>l.count(0)
		max=1
	elsif l.count(1)<l.count(0)
		max=0
	else
		max=1 # oxygen rule
	end
	data.select! {|e|	e[pos]==max}
	pos+=1
end
oxygen=data[0].dup

data=Marshal.load(Marshal.dump(org_data))
pos=0
while data.length > 1 do 
	l=data.transpose[pos]
	if l.count(1)>l.count(0)
		min=0
	elsif l.count(1)<l.count(0)
		min=1
	else
		min=0 # co2 rule
	end
	data.select! {|e|	e[pos]==min}
	pos+=1
end
co2=data[0].dup
p oxygen.join.to_i(2) * co2.join.to_i(2)