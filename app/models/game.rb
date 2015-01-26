class Game < ActiveRecord::Base
	
	belongs_to :lottery_contest
	has_and_belongs_to_many :balls


	validates_presence_of :lottery_contest_id
	validates_presence_of :balls, message: "Nao ha numero vinculado ao jogo."

	
	validate :quantity_balls_per_contest


	def quantity_balls_per_contest
		if not self.lottery_contest.nil?
			if self.lottery_contest.lottery_type.id == 4		
				self.errors.add(:balls,  "Must 15 Balls") if not balls.size == 15
			elsif self.lottery_contest.lottery_type.id == 6
				self.errors.add(:balls, "Must 50 Balls") if not balls.size == 50
			end
		end
	end


	



end
