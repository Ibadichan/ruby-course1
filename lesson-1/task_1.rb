
puts 'Enter your name'
name = gets.chomp
puts 'Enter your height'
height = gets.chomp.to_f

weight = height - 110

if weight > 0
  puts "Weight of #{name} is #{weight}"
else
  puts "Weight of #{name} is optimal"
end
