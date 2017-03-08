puts "enter your the side1"
side1 = gets.chomp.to_f
puts "enter your the side2"
side2 = gets.chomp.to_f
puts"enter your the side3"
side3 = gets.chomp.to_f
cat1 = 0
cat2 = 0
hypotenuse = 0
if side1 > side2 && side1 > side3
  hypotenuse = side1
  cat2 = side2
  cat1 = side3
elsif side2 > side1 && side2 > side3
  hypotenuse = side2
  cat2 = side1
  cat1 = side3
elsif side3 > side2 && side3 > side1
  hypotenuse = side3
  cat1 = side1
  cat2 = side2
end
# проверка на прямоугольный прямоугольник :
if hypotenuse**2 == cat2**2 + cat1**2
  puts "right triangle"
end
# проверка на равнобедренность :
if side1 == side2 || side1 == side3 || side3 == side2
  puts "isosceles triangle"
end
#  проверка на равносторонность :
if side1 == side2 && side1 == side3
  puts "equilatero triangle"
end

