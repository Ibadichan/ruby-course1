require_relative('station')
require_relative('route')
require_relative('train')
require_relative('passenger_train')
require_relative('cargo_train')
require_relative('cargo_car')
require_relative('passenger_car')
require_relative('storage')

class MyProgram

  COMMANDS = %w(
    create_station create_train create_route
    edit_route  assign_route
    add_car remove_car
    forward backward all_stations trains_of_station stop
  )

  def initialize
    @storage = Storage.new
  end

  def create_station
    puts 'Enter the name of the station'
    name_of_station = gets.chomp
    @storage.save_station(name_of_station)
    all_stations
  end

  def create_train
    puts 'Enter the number of the train'
    number = gets.chomp
    puts 'Enter the type of the train (Cargo/Passenger)'
    type = gets.chomp
    @storage.save_train(number, type)
    trains
  end

  def create_route
    all_stations
    puts 'Write the number of your start station from the list'
    start_station = @storage.stations[gets.chomp.to_i-1]
    puts 'Do the same as above for the end station'
    end_station = @storage.stations[gets.chomp.to_i-1]
    @storage.save_route(start_station, end_station)
    routes
  end

  def edit_route
    routes
    puts 'Write the number of your route from the list'
    route = @storage.routes[gets.chomp.to_i-1]
    all_stations
    puts 'choose number of the your station'
    station = @storage.stations[gets.chomp.to_i-1]
    puts 'choose the action (remove/add)'
    action = gets.chomp
    @storage.update_route(route, station, action)
    puts route

  end

  def assign_route
    trains
    puts 'Write the number of your train from the list'
    train = @storage.trains[gets.chomp.to_i-1]
    routes
    puts 'Write the number of your route from the list'
    route = @storage.routes[gets.chomp.to_i-1]
    @storage.assign_route(train, route)
    route.stations[0].trains << train
    current_train(train)
  end

  def add_car
    trains
    puts 'Write the number of your train from the list'
    train = @storage.trains[gets.chomp.to_i-1]
    @storage.save_car(train)
    current_train(train)
  end

  def remove_car
    trains
    puts 'Write the number of your train from the list'
    train = @storage.trains[gets.chomp.to_i-1]
    puts train.cars
    puts 'choose number of car for remove'
    car = gets.chomp.to_i-1
    @storage.remove_car(train, car)
    current_train(train)
  end

  def forward
    trains
    puts 'Write the number of your train from the list '
    train = @storage.trains[gets.chomp.to_i-1]
    train.forward
    @storage.move_train(train)
    current_train(train)

  end

  def backward
    trains
    puts 'Write the number of your train from the list'
    train = @storage.trains[gets.chomp.to_i-1]
    train.backward
    @storage.move_train(train)
    current_train(train)
  end

  def all_stations
    puts @storage.stations.inspect
  end

  def trains_of_station
    all_stations
    puts 'select number of your station'
    station = @storage.stations[gets.chomp.to_i-1]
    puts station.trains
  end

  def welcome
    puts 'Hello!'
    puts '<' * 80
    puts '>' * 80
    puts 'Keep calm and choose your method. To exit, write stop and press Enter'
    puts 'for example: create_train '
    puts '>' * 80
  end

  private
  def current_train(train)
    puts train.inspect
  end

  def routes
    puts @storage.routes.inspect
  end

  def trains
    puts @storage.trains.inspect
  end
end

program = MyProgram.new
program.welcome

MyProgram::COMMANDS.each_with_index {|c,i| puts "#{i+1}. #{c}"}

while true
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
