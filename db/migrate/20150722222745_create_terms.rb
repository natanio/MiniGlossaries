class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.string :content
      t.integer :glossary_id
      t.integer :language_id

      t.timestamps
    end
  end
end
