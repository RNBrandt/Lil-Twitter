class Tweet < ActiveRecord::Base
  belongs_to :user
  validates :post, length: {in: 2..140}
end
