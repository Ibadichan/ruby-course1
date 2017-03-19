class CargoTrain < Train
  TYPE = 'cargo'
  def add_car(car)
    @cars << car if car.class == CargoCar &&  stopped?
  end
end
