input = File.read('input_day_06.txt').split(',').map(&:to_i)

fish = Hash.new(0)
input.group_by { |x| x }.each { |k, v| fish[k] = v.count }

def calculate(days, fish)
  days.times do
    num_new = fish[0]
    fish.transform_keys! { |k| (k - 1) % 9 }
    fish[6] += num_new
  end
  fish.values.sum
end

pp calculate(80, fish.dup)
pp calculate(256, fish.dup)