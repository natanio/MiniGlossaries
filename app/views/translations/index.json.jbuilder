json.array!(@translations) do |translation|
  json.extract! translation, :id, :content, :term_id, :languag_id, :user_id
  json.url translation_url(translation, format: :json)
end
