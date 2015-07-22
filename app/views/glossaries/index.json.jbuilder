json.array!(@glossaries) do |glossary|
  json.extract! glossary, :id, :, :topic, :language_id, :description
  json.url glossary_url(glossary, format: :json)
end
