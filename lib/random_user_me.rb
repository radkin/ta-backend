class RandomUserMe
  attr_accessor :gender, :name, :location, :email, :login, :dob, :registered, :phone, :cell, :id, :picture, :nat

  def initialize(attributes = {})
    @gender = attributes['gender']
    @name = attributes['name']
    @location = attributes['location']
    @email = attributes['email']
    @login = attributes['login']
    @dob = attributes['dob']
    @registered = attributes['registered']
    @phone = attributes['phone']
    @cell = attributes['cell']
    @id = attributes['id']
    @picture = attributes['picture']
    @nat = attributes['nat']
  end
end