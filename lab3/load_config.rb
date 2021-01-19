require 'json'
require_relative 'valera'

class Config
  def load_conf(valerka)
    path = "#{__dir__}/config_game.json"
    file = File.open(path)
    stats = file.read
    stats = JSON.parse(stats)
    valerka.health = stats['health']
    valerka.mana = stats['mana']
    valerka.fun = stats['fun']
    valerka.fatigue = stats['fatigue']
    valerka.money = stats['money']
  end
end
