class User < ActiveRecord::Base

  include BCrypt
  has_many :tweets
  has_many :relationships, foreign_key: "follower_id"
  has_many :reverse_relationships, class_name: "Relationship", foreign_key:"followed_id"
  has_many :following, through: :relationships, source: :followed
  has_many :followers, through: :reverse_relationships, source: :follower

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

  def follow(other_user)
    relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end

end

