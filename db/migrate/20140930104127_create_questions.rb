class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :header
      t.string :description
      t.integer :review, :default => 0

      t.timestamps null: false
    end
  end
end
