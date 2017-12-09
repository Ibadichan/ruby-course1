require_relative 'manufacturer'

class Train
  include Manufacturer

  attr_reader :number, :cars, :index
  attr_accessor :speed, :route

  @trains = {}

  def self.find(number)
    @trains[number]
  end

  def self.add(train, number)
    @trains[number] = train
  end

  def initialize(number)
    @number = number
    @speed = 0
    @cars = []
    @index = 0
    self.class.send :add, self, @number
  end

  def stop
    @speed = 0
  end

  def forward
    @index += 1 if can_next?
  end

  def backward
    @index -= 1 if @index > 0
  end

  def current_station
    route.stations[@index]
  end

  def prev_station
    route.stations[@index - 1] if @index > 0
  end

  def next_station
    route.stations[@index + 1] if can_next?
  end

  def add_car(car)
    @cars << car if valid_car_type?(car) && stopped?
  end

  private

  def stopped?
    @speed.zero?
  end

  def can_next?
    @index <= route.stations.size
  end

  private_class_method :add
end
