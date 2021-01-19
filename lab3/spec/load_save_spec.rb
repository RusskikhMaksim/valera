require_relative '../valera'
require_relative '../load_save/load_game'
require_relative '../load_save/save_game'

RSpec.describe LoadGame do
  let(:valera) {Valera.new}
  let(:savegame) {SaveGame.new}
  let(:loadgame) {LoadGame.new}
  describe '.load' do
    context 'when load stats' do
      it do
        valera.health = 100
        valera.mana = 0
        valera.fun = 2
        valera.fatigue = 0
        valera.money = 0
        savegame.save_data(valera)
        test = loadgame.load(valera)
        expect(test.fun).to eq 2
      end
    end
  end
end
