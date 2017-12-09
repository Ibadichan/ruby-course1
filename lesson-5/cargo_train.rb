class CargoTrain < Train
  TYPE = 'cargo'.freeze

  private

  def valid_car_type?(car)
    car.class == CargoCar
  end
end
