require 'bcrypt'
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
      connection = ActiveRecord::Base.connection
      connection.execute <<-SQL 
      INSERT INTO "users" (name, email, password_digest) VALUES ('#{self.name}', '#{self.email}','#{@p}');
      SQL
    else
      errors.add(:password, "As senhas não batem")
    end
  end

end
