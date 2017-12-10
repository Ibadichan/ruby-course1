require_relative 'my_program'

program = MyProgram.new

puts 'Hello!'
puts '<' * 80
puts '>' * 80
puts 'Keep calm and choose your method. To exit, write stop and press Enter'
puts 'for example: create_train'
puts '>' * 80

MyProgram::COMMANDS.each_with_index { |command, index| puts "#{index + 1}. #{command}" }

loop do
  command = gets.chomp

  until MyProgram::COMMANDS.include?(command)
    puts 'Error!!! Try again'
    command = gets.chomp
  end

  break if command == 'stop'

  program.send(command)

  puts '$' * 80
  puts 'choose method (for exit stop)'
  puts '$' * 80
end
