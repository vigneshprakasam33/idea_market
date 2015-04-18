json.array!(@ideas) do |idea|
  json.extract! idea, :id, :name, :description, :skills, :additional_info, :platform_id, :role_id
  json.url idea_url(idea, format: :json)
end
