json.array!(@promotion_dates) do |promotion_date|
  json.extract! promotion_date, :id, :date, :substantive_rank
  json.url promotion_date_url(promotion_date, format: :json)
end
