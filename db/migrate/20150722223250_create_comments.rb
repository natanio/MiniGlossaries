class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :user_id
      t.integer :translation_id

      t.timestamps
    end
    add_index :comments, :user_id
  end
end
