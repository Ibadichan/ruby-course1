
array = [0, 1]
i = 1

while i < 100
  array << i
  i = array[-1] + array[-2]
end

puts array
