class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :Tweets do |t|
      t.string :content
    end
  end
end
