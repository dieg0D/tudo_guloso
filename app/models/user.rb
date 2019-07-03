require 'bcrypt'
require "base64"

class User < ApplicationRecord
  has_secure_password
  include BCrypt

  validates :name, presence: true, length: {maximum: 50}
  validates :password, presence: true, length: {minimum: 6}
  VALID_EMAIL_FORMAT= /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates :email, presence: true, length: {maximum: 260}, format: { with: VALID_EMAIL_FORMAT}, uniqueness: {case_sensitive: false}
  before_save { self.email = email.downcase }


  def create_user
    if self.password == self.password_confirmation
      @p = BCrypt::Password.create(self.password)
      @image   = Base64.strict_encode64(self.profile_pic.read.to_s)
      connection = ActiveRecord::Base.connection
      connection.execute <<-SQL 
      INSERT INTO "users" (name, email, city, street, profile_pic, age, password_digest) VALUES ('#{self.name}', '#{self.email}', '#{self.city}','#{self.street}', '#{@image}','#{self.age}','#{@p}');
      SQL
      return true
    else
      errors.add(:password, "As senhas não batem")
      return false
    end
  end

  def find_user(id)
    connection = ActiveRecord::Base.connection
    result = connection.execute <<-SQL 
    SELECT * FROM "users" WHERE id = '#{id}';
    SQL
    result = JSON.parse(result.to_json)[0]
    return User.new(id: result["id"], name: result["name"], email: result["email"], city: result["city"], street: result["street"], age: result["age"],  profile_pic: result["profile_pic"])
  end

  def update_user(name,email,city,street,age,profile_pic,id)
    if profile_pic
      image = Base64.strict_encode64(profile_pic.open.read.to_s)
    end
    connection = ActiveRecord::Base.connection
    connection.execute <<-SQL
    UPDATE "users" SET name = '#{name}', email ='#{email}', city ='#{city}', street = '#{street}', age ='#{age}', profile_pic ='#{image}' WHERE id = '#{id}';
    SQL
  end

  def delete_user(id)
    connection = ActiveRecord::Base.connection
    connection.execute <<-SQL
    DELETE FROM "users" WHERE id = '#{id}';
    SQL
  end

end
