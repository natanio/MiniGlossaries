module GlossariesHelper
  def contributor_count(glossary)
    @contributors = glossary.translations.pluck(:user_id).uniq
    @contributors.count
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
