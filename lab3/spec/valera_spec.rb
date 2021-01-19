require_relative '../valera'

RSpec.describe Valera do
  describe '.check_params' do
    context 'when valera feels good' do
      let(:valera_obj) { Valera.new }
      it '.check_params' do
        valera_obj.health = 50
        valera_obj.mana = 20
        valera_obj.fun = 5
        valera_obj.fatigue = 20
        expect(valera_obj.check_params).to eq(true)
      end
    end
  end
  describe '.check_health' do
    context 'when health less than 0' do
      let(:valera_obj) { Valera.new }
      it '.check_health' do
        valera_obj.health = -10
        expect(valera_obj.check_hp).to eq(false)
      end
    end
  end
  describe '.check_fatigue' do
    context 'when fatigue more than 100 and health more than 20' do
      let(:valera_obj) { Valera.new }
      it do
        valera_obj.fatigue = 120
        valera_obj.health = 40
        expect(valera_obj.check_fatigue).to eq(true)
      end
    end
    context 'when fatigue more than 100 and health less than 20' do
      let(:valera_obj) { Valera.new }
      it '.check_fatigue' do
        valera_obj.fatigue = 120
        valera_obj.health = 10
        expect(valera_obj.check_fatigue).to eq(false)
      end
    end
  end
  describe '.check_fun' do
    context 'when fun less than -10 and health less than 20' do
      let(:valera_obj) { Valera.new }
      it '.check_fun' do
        valera_obj.fun = - 15
        valera_obj.health = 10
        expect(valera_obj.check_fun).to eq(false)
      end
    end
    context 'when fun less than -10 and health more than 20' do
      let(:valera_obj) { Valera.new }
      it '.check_params' do
        valera_obj.fun = -15
        valera_obj.health = 40
        expect(valera_obj.check_fun).to eq(true)
      end
    end
  end
end
