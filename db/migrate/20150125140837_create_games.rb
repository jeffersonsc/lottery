class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
    	t.integer :lottery_contest_id, null: false, index: true
      t.timestamps null: false
    end
    add_foreign_key :games, :lottery_contests
  end
end
