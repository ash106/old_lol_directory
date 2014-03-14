json.array!(@summoners) do |summoner|
  json.extract! summoner, :id, :name, :server, :icon_id, :riot_id, :acct_id, :user_id
  json.url summoner_url(summoner, format: :json)
end
