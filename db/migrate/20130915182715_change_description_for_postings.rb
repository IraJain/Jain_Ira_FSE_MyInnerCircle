class ChangeDescriptionForPostings < ActiveRecord::Migration
  def change
    change_table :postings do |t|
      t.change :description, :text
    end
  end
end
