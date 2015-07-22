class Term < ActiveRecord::Base
  belongs_to :glossaries
  belongs_to :language

  has_many :translations
end
