module Validator
  def valid?
    validate!
  rescue => e
    puts e
    false
  end
end
