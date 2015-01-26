class CreateBalls < ActiveRecord::Migration

	def up_data
		0.upto(99) do |i|
			Ball.create(number: i)
		end
	end

  def change
    create_table :balls do |t|
    	t.integer :number
      t.timestamps null: false
    end
    up_data
  end
end
