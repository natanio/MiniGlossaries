module GlossariesHelper
  def contributor_count(glossary)
    glossary.translations.count
  end
end
