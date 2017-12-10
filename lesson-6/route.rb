require_relative 'validator'

class Route
  include Validator
  attr_reader :stations

  def initialize(start_station, end_station)
    @stations = [start_station, end_station]
    validate!
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def remove_station(station)
    return unless stations.include?(station)
    stations.delete(station) if station != stations.first && station != stations.last
  end

  private

  def validate!
    raise 'Invalid station type!!!' unless @stations.all? { |station| station.is_a?(Station) }
    true
  end
end
