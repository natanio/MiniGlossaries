class Glossary < ActiveRecord::Base
  belongs_to :user
  belongs_to :language

  has_many :terms
  has_many :translations, through: :terms

  def self.search(search)
    where("topic ILIKE ?", "%#{search}%")
    where("description ILIKE ?", "%#{search}%")
  end
end
