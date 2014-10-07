json.array!(@items) do |item|
  json.extract! item, :id, :invoice_id, :project_id
  json.url item_url(item, format: :json)
end
