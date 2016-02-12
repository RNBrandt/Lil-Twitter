class User < ActiveRecord::Base
  has_many: tweets
  has_many: relationships, foreign_key: follower_id
  has_many: followers, class_name: "User", through: relationships

  # def relationships
  #   Relationship.where(user_id: self.id)
  # end

  # method named relationships
  # model called Relationship

  include BCrypt

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence:true, uniqueness: true
  validates :handle, presence:true, uniqueness: true
  validates :password_hash, presence: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    return user if user && user.password == password
  end

end

