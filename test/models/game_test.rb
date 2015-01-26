require 'test_helper'

class GameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  #testes que deverao ser feito:
  # => Jogo com uma bola marcada duas vezes
  # => Quantidade correta de bolas em cata tipo de loteria

  test "Jogo nao possui concurso" do
  	game = Game.new(lottery_contest_id: nil)
  	assert_not game.save, "Jogo sem concurso." 
  end

  test "Jogo nao possui bolas vinculadas" do
  	game = Game.create(lottery_contest_id: 10)
  	assert game.errors.messages[:balls].include?("Nao ha numero vinculado ao jogo."), "Nao ha bolas relacionadas."
  end

  test "Lotomania" do
  	game = Game.new(lottery_contest_id: 11)
  	game.balls << Ball.limit(50)
  	assert_equal 50, game.balls.size, "Ha 50 bolas vinculadas ao jogo da Lotomania."

  	game = Game.new(lottery_contest_id: 11)
  	game.balls << Ball.limit(20)
  	assert_not_equal 50, game.balls.size, "Nao ha 50 bolas vinculadas ao jogo da Lotomania."
  end
  
  test "Lotofacil" do
  	game = Game.new(lottery_contest_id: 12)
  	game.balls << Ball.limit(15)
  	assert_equal 15, game.balls.size, "Ha 15 bolas vinculadas ao jogo da Lotofacil"

  	game = Game.new(lottery_contest_id: 12)
  	game.balls << Ball.limit(14)
  	assert_not_equal 15, game.balls.size, "Nao ha 15 bolas vinculadas ao jogo da Lotofacil"
  end

end
