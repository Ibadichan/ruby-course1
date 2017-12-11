class Storage
  attr_reader :stations, :trains, :routes, :cars
  attr_writer :route

  def initialize
    @stations = []
    @trains = []
    @routes = []
    @cars = []
  end

  def save_station(name_of_station)
    station = Station.new(name_of_station)
    @stations << station
  rescue => e
    log_error(e)
  end

  def save_train(number, type)
    train = CargoTrain.new(number) if type == 'Cargo'
    train = PassengerTrain.new(number) if type == 'Passenger'
    @trains << train
  rescue => e
    log_error(e)
  end

  def save_route(start_station, end_station)
    route = Route.new(start_station, end_station)
    @routes << route
  rescue => e
    log_error(e)
  end

  def update_route(route, station, action)
    route.add_station(station) if action == 'add'
    route.remove_station(station) if action == 'remove'
  end

  def assign_route(train, route)
    train.route = route
    route.stations[0].trains << train
  end

  def save_car(car)
    @cars << car
  end

  def move_train(train)
    train.route.stations[train.index - 1].trains.delete(train)
    train.route.stations[train.index].trains << train
  end

  private

  def log_error(e)
    puts e.message
    puts 'Try again'
  end
end
