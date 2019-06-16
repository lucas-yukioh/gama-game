class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :questions, array: true
      t.integer :question_number
      t.integer :score
      t.string :slug

      t.timestamps
    end

    add_index :games, :slug, unique: true
  end
end
