require_relative 'validation'

class Station
  include Validation
  attr_reader :trains

  @stations = []

  validate :name, :presence

  def self.add(station)
    @stations << station
  end

  def self.all
    @stations
  end

  def initialize(name)
    @name = name
    validate!
    @trains = []
    self.class.send :add, self
  end

  def add_train(train)
    @trains << train
  end

  def trains_by_type(type)
    types = { cargo: 'CargoTrain', passenger: 'PassengerTrain' }
    @trains.select { |train| types[type.to_sym] == train.class.to_s }
  end

  def remove_train(train)
    @trains.delete(train)
  end

  def each_train
    @trains.each { |train| yield(train) }
  end

  private_class_method :add
end
