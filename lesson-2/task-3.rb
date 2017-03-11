arr = [0,1]
i = 1
while i < 100 do
  arr << i
  i = arr[-1] + arr[-2]
end
puts arr
