require 'json'
require 'pathname'

class LoadGame
  def initialize
    @file_name = File.expand_path('../_saves/autosave.json', __dir__)
  end

  def valid?
    Pathname.new(@file_name).exist?
  end

  def load(valerka)
    file = File.open(@file_name)
    stats = file.read
    stats = JSON.parse(stats)
    valerka.health = stats['health']
    valerka.mana = stats['mana']
    valerka.fun = stats['fun']
    valerka.fatigue = stats['fatigue']
    valerka.money = stats['money']
    valerka
  end
end
