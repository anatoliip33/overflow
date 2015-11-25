class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :header
      t.string :description
      t.integer :review, default: 0
      t.integer :score, :integer, default: 0, null: false

      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
