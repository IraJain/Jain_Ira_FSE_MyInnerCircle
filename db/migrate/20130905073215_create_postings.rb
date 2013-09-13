class CreatePostings < ActiveRecord::Migration
  def change
    create_table :postings do |t|
      t.string :title
      t.string :description
      t.integer :phone
      t.string :location
      t.integer :user_id

      t.timestamps
    end
  end
end
