class PassengerTrain < Train
  TYPE = 'passenger'
  def add_car(car)
    @cars << car if car.class == PassengerCar &&  stopped?
  end
end