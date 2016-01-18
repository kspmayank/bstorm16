json.array!(@levels) do |level|
  json.extract! level, :id, :question, :answer, :link, :hint
  json.url level_url(level, format: :json)
end
