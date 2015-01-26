class CreateLotteryContests < ActiveRecord::Migration
  def change
    create_table :lottery_contests do |t|
    	t.integer :number, null: false
    	t.integer :lottery_type_id, null: false
      t.timestamps null: false
    end
    add_foreign_key :lottery_contests, :lottery_types
  end
end
