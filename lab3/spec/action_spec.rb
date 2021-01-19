require_relative '../actions'
require_relative '../valera'

RSpec.describe Actions do
  let(:test) { Valera.new }
  let(:action) { Actions.new }
  describe '.go_work' do
    context 'when go work' do
      it do
        test.health = 100
        test.mana = 0
        test.fun = 5
        test.fatigue = 0
        test.money = 0
        action.go_work(test)
        expect(test.fun).to eq 0
      end
    end
    context 'when in Valera\'s blood to much alcohol' do
      it do
        test.health = 100
        test.mana = 60
        test.fun = 5
        test.fatigue = 0
        test.money = 0
        action.go_work(test)
        expect(test.fun).to eq 5
      end
    end
    context 'when Valera is too tired' do
      it do
        test.health = 100
        test.mana = 0
        test.fun = 5
        test.fatigue = 20
        test.money = 0
        action.go_work(test)
        expect(test.fun).to eq 5
      end
    end
    context 'when too tired and drunk' do
      it do
        test.health = 100
        test.mana = 60
        test.fun = 5
        test.fatigue = 30
        test.money = 0
        action.go_work(test)
        expect(test.fun).to eq 5
      end
    end
  end
  describe '.chill' do
    context 'when go chill' do
      it do
        test.health = 100
        test.mana = 0
        test.fun = 5
        test.fatigue = 0
        test.money = 0
        action.chill(test)
        expect(test.fun).to eq 6
      end
    end
    context 'when fun = 10 and alco = 0' do
      it do
        test.health = 100
        test.mana = 0
        test.fun = 10
        test.fatigue = 0
        test.money = 0
        action.chill(test)
        expect(test.fun).to eq 10
        expect(test.mana).to eq 0
      end
    end
  end
  describe '.drink_vine' do
    context 'when go drink vine' do
      it do
        test.health = 100
        test.mana = 0
        test.fun = 5
        test.fatigue = 0
        test.money = 20
        action.drink_vine(test)
        expect(test.fun).to eq 4
      end
    end
    context 'when not enough money' do
      it do
        test.health = 100
        test.mana = 0
        test.fun = 5
        test.fatigue = 0
        test.money = 0
        action.drink_vine(test)
        expect(test.fun).to eq 5
      end
    end
    context 'when mana has max value' do
      it do
        test.health = 100
        test.mana = 90
        test.fun = 5
        test.fatigue = 0
        test.money = 40
        action.drink_vine(test)
        expect(test.mana).to eq 100
      end
    end
  end
  describe '.drink_in_bar' do
    context 'when go drink in bar' do
      it do
        test.health = 100
        test.mana = 0
        test.fun = 5
        test.fatigue = 0
        test.money = 100
        action.drink_in_bar(test)
        expect(test.fun).to eq 6
      end
    end
    context 'when not enough money' do
      it do
        test.health = 100
        test.mana = 0
        test.fun = 5
        test.fatigue = 0
        test.money = 0
        action.drink_in_bar(test)
        expect(test.fun).to eq 5
      end
    end
    context 'when mana has max value' do
      it do
        test.health = 100
        test.mana = 90
        test.fun = 5
        test.fatigue = 0
        test.money = 120
        action.drink_in_bar(test)
        expect(test.mana).to eq 100
      end
    end
    context 'when fun has max value' do
      it do
        test.health = 100
        test.mana = 40
        test.fun = 10
        test.fatigue = 0
        test.money = 120
        action.drink_in_bar(test)
        expect(test.fun).to eq 10
      end
    end
  end
  describe '.drink_with_marginal' do
    context 'when go drink with marginal' do
      it do
        test.health = 100
        test.mana = 0
        test.fun = 5
        test.fatigue = 0
        test.money = 150
        action.drink_with_marginal(test)
        expect(test.fun).to eq 10
      end
    end
    context 'when not enough money' do
      it do
        test.health = 100
        test.mana = 0
        test.fun = 5
        test.fatigue = 0
        test.money = 15
        action.drink_with_marginal(test)
        expect(test.fun).to eq 5
      end
    end
    context 'when fun = 10 and alco = 100' do
      it do
        test.health = 100
        test.mana = 90
        test.fun = 10
        test.fatigue = 0
        test.money = 150
        action.drink_with_marginal(test)
        expect(test.fun).to eq 10
        expect(test.mana).to eq 100
      end
    end
  end
  describe '.sing_in_metro' do
    context 'when go sing in metro' do
      it do
        test.health = 100
        test.mana = 0
        test.fun = 5
        test.fatigue = 0
        test.money = 0
        action.sing_in_metro(test)
        expect(test.fun).to eq 6
      end
    end
    context 'when alco > 40 and < 70' do
      it do
        test.health = 100
        test.mana = 50
        test.fun = 5
        test.fatigue = 0
        test.money = 0
        action.sing_in_metro(test)
        expect(test.money).to eq 60
      end
    end
  end
  describe '.sleep' do
    context 'when go sleep' do
      it do
        test.health = 100
        test.mana = 80
        test.fun = 5
        test.fatigue = 0
        test.money = 0
        action.sleep(test)
        expect(test.fun).to eq 2
      end
    end
    context 'when alco < 30' do
      it do
        test.health = 10
        test.mana = 20
        test.fun = 5
        test.fatigue = 0
        test.money = 0
        action.sleep(test)
        expect(test.health).to eq 100
        expect(test.mana).to eq 0
      end
    end
    context 'when alco < 30 and health > 10' do
      it do
        test.health = 40
        test.mana = 20
        test.fun = 5
        test.fatigue = 0
        test.money = 0
        action.sleep(test)
        expect(test.health).to eq 100
        expect(test.mana).to eq 0
      end
    end
  end
  describe '.play_dota' do
    context 'when go play dota' do
      it do
        test.health = 100
        test.mana = 0
        test.fun = 5
        test.fatigue = 0
        test.money = 0
        action.play_dota(test)
        expect(test.fatigue).to eq 10
      end
    end
  end
end
