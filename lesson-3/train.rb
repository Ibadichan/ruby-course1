class Train
  attr_reader :type, :number, :cars
  attr_accessor :speed, :route

  def initialize(number, type, cars)
    @number = number
    @type = type
    @cars = cars
    @speed = 0
    @index = 0
  end

  def stop
    @speed = 0
  end

  def add_car
    @cars += 1 if stopped?
  end

  def remove_car
    @cars -= 1 if stopped? && @cars.zero?
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

  private

  def can_next?
    @index <= route.stations.size
  end

  def stopped?
    speed.zero?
  end
end
