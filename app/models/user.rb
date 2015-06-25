require 'bcrypt'
class User < ActiveRecord::Base

  validates :email, presence: true, uniqueness: true
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash =  @password
  end

  def self.authenticate(email, password_attempt)
    user = User.find_by(email: email)
    return user if user && user.password == password_attempt
  end
end
