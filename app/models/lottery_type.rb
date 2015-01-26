class LotteryType < ActiveRecord::Base
	has_many :lottery_contests
end
