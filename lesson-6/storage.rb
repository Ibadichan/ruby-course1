class Storage
  attr_reader :stations, :trains, :routes
  attr_writer :route
  attr_accessor :number

  FORMAT_NUMBER = /^([a-z]|\d){3}-?([a-z]|\d){2}$/i

  def initialize
    @stations = []
    @trains = []
    @routes = []
  end

  def save_station(name_of_station)
    station = Station.new(name_of_station)
    @stations << station
  end

  def save_train(number, type)
    train = CargoTrain.new(number) if type == 'Cargo'
    train = PassengerTrain.new(number) if type == 'Passenger'
    @trains << train
  end

  def save_route(start_station, end_station)
    route = Route.new(start_station, end_station)
    @routes << route
  end

  def update_route(route,station, action)
    route.add_station(station) if action == 'add'
    route.remove_station(station) if action == 'remove'
  end

  def assign_route(train,route)
    train.route = route
  end

  def  save_car(train)
    car = CargoCar.new if train.class == CargoTrain
    car = PassengerCar.new if train.class == PassengerTrain
    train.add_car(car)
  end

  def remove_car(train,car)
    train.cars.delete_at(car)
  end

  def move_train(train)
    train.route.stations[train.index-1].trains.delete(train)
    train.route.stations[train.index].trains << train
  end

  def valid?
    validate!
  rescue
    false
  end

  def validate!
    raise if  self.number !~ FORMAT_NUMBER
  rescue RuntimeError
    puts 'invalid number, enter new number :'
    number = gets.chomp
    self.number = number
    retry
  ensure puts 'valid number (: !!! '
  end
end
