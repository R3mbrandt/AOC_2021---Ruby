input = IO.readlines("input_day_04.txt")
numbers=input[0].split(',').map(&:to_i)

nchunks=(input[2..-1].length/(input[2..-1].map(&:strip).count("")+1))

### Part 1
boards=input[2..-1].map(&:strip).delete_if{|e| e==""}.each_slice(nchunks).to_a.map{|b| b.map{|r| r.split.map(&:to_i)}}
numbers.each do |n|
	do_break=false
	sum=0
	last_number=n
	boards.each do |b|
		b.map!{|r| r.map!{ |e| e == n ? 'x' : e }}
		b.each do |r|
			if r.all?('x') 
				puts "BINGO"
				do_break=true
			end
		end
		b.transpose.each do |c|
			if c.all?('x')
				puts "BINGO"
				do_break=true
			end
		end
		if do_break
			p b
			p b.transpose
			b.each{|r| r.map{|e| sum+=e if e!='x'}}
			break
		end		
	end
	if do_break
		p last_number*sum
		break
	end	
end	

### Part 2
boards=input[2..-1].map(&:strip).delete_if{|e| e==""}.each_slice(nchunks).to_a.map{|b| b.map{|r| r.split.map(&:to_i)}}
last_board=false
numbers.each do |n|
	winner=[]
	sum=0
	last_number=n
	boards.each_with_index do |b,i|
		b.map!{|r| r.map!{ |e| e == n ? 'x' : e }}
		b.each do |r|
			if r.all?('x') 
				winner<<i
			end
		end
		b.transpose.each do |c|
			if c.all?('x')
				winner<<i
			end
		end
	end
	if winner != []
		if last_board == false 
			winner.uniq.sort.reverse.map{|w| boards.delete_at(w)}
			if boards.length==1
				puts "LAST BOARD",winner,last_number
				last_board=true
			end
		else
			boards[0].each{|r| r.map{|e| sum+=e if e!='x'}} 
			p boards[0], last_number
			puts sum * last_number
			break
		end
	end	
end	
