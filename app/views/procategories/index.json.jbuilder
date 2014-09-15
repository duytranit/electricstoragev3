json.array!(@procategories) do |procategory|
  json.extract! procategory, :id, :name, :description, :ddc, :status
  json.url procategory_url(procategory, format: :json)
end
