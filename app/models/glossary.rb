class Glossary < ActiveRecord::Base
  belongs_to :user
  belongs_to :language

  has_many :terms
  has_many :translations, through: :terms
end
