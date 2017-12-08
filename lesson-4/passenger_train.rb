class PassengerTrain < Train
  TYPE = 'passenger'.freeze

  private

  def valid_car_type?(car)
    car.class == PassengerCar
  end
end
