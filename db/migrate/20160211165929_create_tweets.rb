class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text  :post
      t.references :user, index: true
    end
  end
end
