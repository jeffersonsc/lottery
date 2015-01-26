require 'test_helper'

class LotteryContestTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "Concurso e Tipo de Jogo nulo" do
  	contest = LotteryContest.create(number: nil, lottery_type_id: nil)
  	assert contest.invalid?, "Nao ha numero de concurso e o tipo de jogo."
  end

  test "Concurso nulo" do 
  	contest = LotteryContest.create(number: nil, lottery_type_id: 1)
  	assert contest.invalid?, "Nao ha numero de concurso."
  end

  test "Tipo de Jogo nulo" do
  	contest = LotteryContest.create(number: 1, lottery_type_id: nil)
  	assert contest.invalid?, "Nao ha tipo de jogo."
  end

  test "Concurso duplicado para o mesmo Tipo de Loteria" do
  	contest = LotteryContest.create(number: 1, lottery_type_id: 1)
  	contest = LotteryContest.create(number: 1, lottery_type_id: 1)
  	assert contest.invalid?, "Nao foi possivel criar. Concurso ja existe."
  end
end
