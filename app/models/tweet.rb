class Tweet < ActiveRecord::Base
  has_one :retweet, class_name: "Tweet"
  belongs_to :user
  validates :post, length: {in: 2..140}
end
