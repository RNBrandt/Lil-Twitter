class AddRetweetToTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :rewteet_id, :integer
  end
end
