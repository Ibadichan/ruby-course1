require_relative 'manufacturer'
require_relative 'validator'

class Train
  FORMAT_NUMBER = /^[a-z\d]{3}-?[a-z\d]{2}$/i

  include Manufacturer
  include Validator

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
    validate!
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

  def each_car
    @cars.each { |car| yield(car) }
  end

  private

  def stopped?
    @speed.zero?
  end

  def can_next?
    @index <= route.stations.size
  end

  def validate!
    raise 'Number is invalid ' if @number !~ FORMAT_NUMBER
    true
  end

  private_class_method :add
end
