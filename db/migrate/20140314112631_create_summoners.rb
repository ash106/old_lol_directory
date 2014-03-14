class CreateSummoners < ActiveRecord::Migration
  def change
    create_table :summoners do |t|
      t.string :name
      t.string :server
      t.integer :icon_id
      t.integer :riot_id
      t.integer :acct_id
      t.references :user, index: true

      t.timestamps
    end
  end
end
