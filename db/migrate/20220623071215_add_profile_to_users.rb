class AddProfileToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.string :name
      t.string :education
      t.date :birthday
      t.string :location
      t.text :other
    end
  end
end
