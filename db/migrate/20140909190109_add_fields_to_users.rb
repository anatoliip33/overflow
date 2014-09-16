class AddFieldsToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :login
      t.string :avatar
      t.string :birthday
      t.string :country
      t.string :city
      t.string :address
    end
  end
end
