json.array!(@addresses) do |address|
  json.extract! address, :id, :address_type, :street_address, :street_address_2, :town, :county, :country, :post_code
  json.url address_url(address, format: :json)
end
