input = IO.readlines("input_day_08.txt")

$digits = {0=>'abcefg',1=>'cf',2=>'acdeg',3=>'acdfg',4=>'bcdf',5=>'abdfg',6=>'abdefg',7=>'acf',8=>'abcdefg',9=>'abcdfg'}

def find_perm_slow(before)
	('a'..'h').to_a.permutation.each do |perm|
		ok=true
		d={}
		('a'..'h').each_with_index {|l,i| d[l] = perm[i]}
		before.each do |w|
			w_perm=''
			w.chars.each {|c| w_perm<<d[c]}
			w_perm=w_perm.chars.sort.join
			ok = false if not $digits.has_value?(w_perm)
		end
		return d if ok 
	end
end

### Part One
data=input.map {|line| line.strip.split(' | ').map{|e| e.split(' ')}}

count=0
data.each do |l|
	count+=l[1].select{|e| (e.length==2 or e.length==3 or e.length==4 or e.length==7)}.count
end

p count

### Part Two
ans=0
data.each do |l|
	d=find_perm_slow(l[0])
	ret =''
	l[1].each do |w|
		w_perm=''
		w.chars.each {|c| w_perm<<d[c]}
		w_perm=w_perm.chars.sort.join
		k=$digits.key(w_perm)
		if k==nil then raise "Key Error #{[l[1],w,w_perm,d]}" end
		ret<<k.to_s
	end
	ans+=ret.to_i	
end	
puts ans