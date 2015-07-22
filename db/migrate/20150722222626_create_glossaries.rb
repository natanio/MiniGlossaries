class CreateGlossaries < ActiveRecord::Migration
  def change
    create_table :glossaries do |t|
      t.integer :user_id
      t.string :topic
      t.integer :language_id
      t.string :description

      t.timestamps
    end
    add_index :glossaries, :language_id
  end
end
