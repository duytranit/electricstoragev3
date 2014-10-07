json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :user_id
  json.url invoice_url(invoice, format: :json)
end
