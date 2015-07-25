class Term < ActiveRecord::Base
  belongs_to :glossary
  belongs_to :language

  has_many :translations
end
