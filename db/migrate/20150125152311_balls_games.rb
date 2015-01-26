class BallsGames < ActiveRecord::Migration
  def change
  	create_table :balls_games, id: false do |t|
    	t.integer :ball_id, null: false
    	t.integer :game_id, null: false
    end
    add_foreign_key :balls_games, :balls
    add_foreign_key :balls_games, :games
    add_index :balls_games, [:ball_id, :game_id], unique: true
    add_index :balls_games, [:game_id, :ball_id], unique: true
  end
end
