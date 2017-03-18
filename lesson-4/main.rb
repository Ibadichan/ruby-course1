require_relative('station')
require_relative('route')
require_relative('train')
require_relative('cargo_car')
require_relative('passenger_car')
require_relative('passenger_train')
require_relative('cargo_train')

class MyProgramm
  attr_reader :stations, :trains, :routes
  attr_writer :route

  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  def create_station
    puts 'Enter the name of the station'
    name_of_station = gets.chomp
    station = Station.new(name_of_station)
    @stations << station
  end

  def create_train
    puts 'Enter the number of the train'
    number = gets.chomp
    puts 'Enter the type of the train (Cargo/Passenger)'
    type = gets.chomp
    train = CargoTrain.new(number) if type == 'Cargo'
    train = PassengerTrain.new(number) if type == 'Passenger'
    @trains << train
  end

  def create_route
    puts stations.inspect
    puts 'Write the number of your start station from the list'
    start_station = @stations[gets.chomp.to_i-1]
    puts 'Do the same as above for the end station'
    end_station = @stations[gets.chomp.to_i]
    route = Route.new(start_station,end_station)
    @routes << route
  end

  def edit_route
    puts routes.inspect
    puts 'Write the number of your route from the list'
    route = @routes[gets.chomp.to_i-1]
    puts stations.inspect
    puts 'choose number of the your station'
    station = @stations[gets.chomp.to_i-1]
    puts 'choose the action (remove/add)'
    action = gets.chomp
    route.add_station(station) if action == 'add'
    route.remove_station(station) if action == 'remove'
  end

  def assign_route
    puts trains.inspect
    puts 'Write the number of your train from the list'
    train = @trains[gets.chomp.to_i-1]
    puts routes.inspect
    puts 'Write the number of your route from the list'
    route = @routes[gets.chomp.to_i-1]
    train.route = route
  end

  def add_car
    puts trains.inspect
    puts 'Write the number of your train from the list'
    train = trains[gets.chomp.to_i-1]
    car = CargoCar.new if train.class == CargoTrain
    car = PassengerCar.new if train.class == PassengerTrain
    train.add_car(car)
  end

  def remove_car
    puts trains.inspect
    puts 'Write the number of your train from the list'
    train = trains[gets.chomp.to_i-1]
    puts train.cars
    puts 'choose number of car for remove'
    car = gets.chomp.to_i-1
    train.cars.delete_at(car)
    puts trains.inspect
  end

  def forward
    puts trains.inspect
    puts 'Write the number of your train from the list '
    train = trains[gets.chomp.to_i-1]
    train.forward
  end

  def backward
    puts trains.inspect
    puts 'Write the number of your train from the list'
    train = trains[gets.chomp.to_i-1]
    train.backward
  end

  def all_stations
    puts stations.inspect
  end

  def trains_of_station
    all_stations
    puts 'select number of your station'
    station = all_stations[gets.chomp-1]
    puts station.train
  end
end

commands = %w(
  create_station create_train create_route
  edit_route  assign_route
  add_car remove_car
  forward backward all_stations all_trains stop routes
)
programm = MyProgramm.new

puts 'Hello!'
puts '<' * 80
puts '>' * 80
puts 'Keep calm and choose your method. To exit, write stop and press Enter'
puts 'for example: create_train '
puts '>' * 80
commands.each_with_index {|c,i| puts "#{i+1}. #{c}"}

while true
  command = gets.chomp

  until commands.include?(command)
    puts 'Error!!! Try again'
    command = gets.chomp
  end

  break if command == 'stop'

  programm.send(command)

  puts '$' * 80
  puts 'choose method (for exit stop)'
  puts '$' * 80
end

