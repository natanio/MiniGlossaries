module GlossariesHelper
  def contributor_count(glossary)
    glossary.translations.count
  end

  def get_languages(term)
    @languages = []
    if term.translations.count != 0
      term.translations.each do |translation|
        @languages << translation.language.name
      end
    end
    @languages.join(",")
  end
end
