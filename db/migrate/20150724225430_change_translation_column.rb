class ChangeTranslationColumn < ActiveRecord::Migration
  def change
    rename_column :translations, :languag_id, :language_id
  end
end
