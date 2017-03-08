puts "enter your a"
a = gets.chomp.to_f
puts "enter your b"
b = gets.chomp.to_f
puts "enter your c"
c = gets.chomp.to_f
d = b**2 - (4 * a * c)
dis = "Discriminant : #{d}"
if d > 0
  sqrt = Math.sqrt(d)
  puts "#{dis} , x1 :#{( -b + sqrt ) / (2 * a)} , x2 :#{( -b - sqrt) / (2 * a)}."
elsif d == 0
  puts "#{dis}, x :#{(-b)/(2*a)} ."
else 
  puts "#{dis} , Корней нет!!!"
end
