
puts 'Enter your the side 1'
side1 = gets.chomp.to_f
puts 'Enter your the side 2'
side2 = gets.chomp.to_f
puts 'Enter your the side 3'
side3 = gets.chomp.to_f

sides = [side1, side2, side3]
hypotenuse = sides.max
sides.delete_at(sides.index(hypotenuse))

leg1 = sides.first
leg2 = sides.last

puts 'Right triangle'       if hypotenuse**2 == leg2**2 + leg1**2
puts 'Isosceles triangle'   if side1 == side2 || side1 == side3 || side3 == side2
puts 'Equilateral triangle' if side1 == side2 && side1 == side3
