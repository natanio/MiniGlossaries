json.array!(@terms) do |term|
  json.extract! term, :id, :content, :glossary_id, :language_id
  json.url term_url(term, format: :json)
end
