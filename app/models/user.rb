class User < ActiveRecord::Base

  validates :email, presence: true, uniqueness: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash =  @password
  end

  def self.authenticate(username, password_attempt)
    user = User.find_by(username: username)
    return user if user && user.password == password_attempt
  end
en
