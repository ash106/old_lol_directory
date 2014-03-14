class AddLeagueToSummoners < ActiveRecord::Migration
  def change
    add_column :summoners, :league, :json
  end
end
