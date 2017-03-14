class Station
  attr_reader :trains
  def initialize(name)
    @name = name
    @trains = []
  end
  
  def add_train(train)
    @trains << train
  end
  
  def by_type(type)
    @trains.select {|train| type == train.type}
  end
  
  def remove_train(train)
    @trains.delete(train)
  end
end

class Route
  attr_reader :all_stations
  def initialize(start_station,end_station)
    @start_station = start_station
    @end_station = end_station
    @intermediate_stations = []
  end
  
  def add_station(station)
    @intermediate_stations << station
  end
  
  def remove_station(station)
    @intermediate_stations.delete(station)
  end
  
  def all_stations
    all_stations = [@start_station]
    all_stations += @intermediate_stations
    all_stations << @end_station
    all_stations
  end
end

class Train
  attr_reader :type, :number ,:cars, :route
  attr_accessor :speed
  
  def initialize(number,type,cars)
    @number = number
    @type = type
    @cars = cars
    @speed = 0
    @step = 0
  end
  
  def stop
    @speed = 0
  end
  
  def add_car
    @cars += 1 if @speed == 0
  end
  
  def remove_car
    @cars -= 1 if @speed ==0
  end
  
  def set_route(route)
    @route = route
  end
  
  def next_step
    @step += 1
  end
  
  def prev_step
    @step -= 1
  end
  
  def current_station
    @route.all_stations[@step]
  end
  
  def prev_station
    @route.all_stations[@step-1]
  end
  
  def next_station
    @route.all_stations[@step+1]
  end
end

station_moskva = Station.new("moskva")
station_milan = Station.new("milan")
station_kiev = Station.new("kiev")
station_buharest = Station.new("buharest")

route = Route.new(station_moskva,station_milan)
route.add_station(station_kiev)
route.add_station(station_buharest)

train1 = Train.new("Ld-65","passenger",5)

train1.set_route(route)

train1.next_step

puts train1.current_station.inspect

 
