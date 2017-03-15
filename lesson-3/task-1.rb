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
  attr_accessor :speed, :route
  
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
    return if @cars == 0  # нельзя уменьшить вагоны когда их 0
    @cars -= 1 if @speed ==0
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

train = Train.new("Ld-65","passenger",5)

station_moskva = Station.new("moskva")
station_milan = Station.new("milan")
station_kiev = Station.new("kiev")
station_buharest = Station.new("buharest")

route = Route.new(station_moskva,station_milan)


station_moskva.add_train(train) # станция может принимать поезда
puts station_moskva.trains.inspect # показать все поезда на станции в текущий момент
puts station_moskva.by_type("passenger").inspect #может показывать список поездов на станции по типу, >>
puts station_moskva.by_type("passenger").count # и их количеству.
station_moskva.remove_train(train) # может отправлять поезда 

route.add_station(station_kiev) # маршрут может добавлять промежуточные станции
route.add_station(station_buharest) #добавляет также станцию
route.remove_station(station_kiev) # может удалять промежуточные станции
puts route.all_stations.inspect # вывести список всех станций от начала до конечной

train.speed = 100 # может набирать скорость
puts train.speed # может показывать текущую скорость
puts train.stop # может сбрасывать скорость до 0
puts train.cars # может показать количество вагонов
train.add_car # может добавлять вагон
train.remove_car # может отцеплять вагон

train.route = route # может принимать маршрут
train.next_step # может перемещаться на станцию вперед
train.prev_step # может перемещаться на станцию назад

puts train.current_station # может показывать текущую станцию
puts train.prev_station # может показывать предыдущую станцию
puts train.next_station # может показать следующую станцию
