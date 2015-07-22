class Language < ActiveRecord::Base
  has_many :terms
  has_many :translations
  has_many :glossaries
end
