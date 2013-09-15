class ChangePhoneForPostings < ActiveRecord::Migration
  def change
    change_table :postings do |t|
      t.change :phone, :string
    end
  end
end
