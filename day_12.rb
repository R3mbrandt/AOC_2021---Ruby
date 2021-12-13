require 'set'

input = IO.readlines("input_day_12.txt")
@data=Hash.new([])
input.each do |l|
	(a,b)=l.strip.split('-')
	@data[a]+=[b] unless b=="start"
	@data[b]+=[a] unless a=="start"
end

# Part 1
def walk1(node, path)
	return 1 if node == 'end'
	#p [node,path]
  @data[node].reject { |n| n.downcase == n && path.include?(n) }.sum { |next_node| walk1(next_node, path + [next_node]) }
end
pp walk1('start', ['start'])

# Part 2
def walk2(node, path)
  return 1 if node == 'end'
  @data[node].reject do |n|
    n.downcase == n && path.include?(n) && path.tally.any? { |k, v| k.downcase == k && v == 2 }
  end.sum { |next_node| walk2(next_node, path + [next_node]) }
end
pp walk2('start', ['start'])