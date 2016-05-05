class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title, limit: 300
      t.string :body, limit: 30000
      t.string :content_title, limit: 300
      t.integer :content_episode
      t.references :user, index: true, foreign_key: true
      t.integer :level

      t.timestamps null: false
    end
  end
end
