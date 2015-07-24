module GlossariesHelper
  def contributor_count(glossary)
    glossary.translations.count
  end

  def get_languages(term)
    @languages = []
    term.translations.each do |translation|
      @languages << translation.language.name
    end
    @languages.join(",")
  end
end
