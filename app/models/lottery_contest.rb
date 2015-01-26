class LotteryContest < ActiveRecord::Base
	validates_presence_of :number
	validates_presence_of :lottery_type_id
	validates_uniqueness_of :number, scope: :lottery_type_id
	belongs_to :lottery_type
	has_many :games
end
