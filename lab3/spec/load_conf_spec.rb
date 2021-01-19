require_relative '../load_config'
require_relative '../valera'

RSpec.describe Config do
  describe '.load_conf' do
    context 'config is read correctly' do
      let(:valera) { Valera.new }
      let(:config) { Config.new }
      it '.load_conf' do
        config.load_conf(valera)
        expect(valera.health).to eq(100)
      end
    end
  end
end
