class CreateLotteryTypes < ActiveRecord::Migration
  def load_data
    LotteryType.create(game: "Mega-Sena")
    LotteryType.create(game: "Federal")
    LotteryType.create(game: "Loteca")
    LotteryType.create(game: "Lotofacil")
    LotteryType.create(game: "Lotogol")
    LotteryType.create(game: "Lotomania")
    LotteryType.create(game: "Quina")
    LotteryType.create(game: "Timemania")
    LotteryType.create(game: "Dupla Sena")
    LotteryType.create(game: "Instantanea")
  end

  def change
    create_table :lottery_types do |t|
      t.string :game
      t.timestamps null: false
    end

    load_data
  end
end
