class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.string :content
      t.integer :term_id
      t.integer :languag_id
      t.integer :user_id

      t.timestamps
    end
    add_index :translations, :term_id
  end
end
