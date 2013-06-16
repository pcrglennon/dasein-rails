json.array!(@players) do |player|
  json.extract! player, :name, :class_year, :number, :height, :hometown
  json.url player_url(player, format: :json)
end
