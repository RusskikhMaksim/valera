require 'json'
require 'pathname'

class SaveGame
  def initialize
    @file_name = File.expand_path('../_saves/autosave.json', __dir__)
  end

  def save_data(val)
    health = val.health
    mana = val.mana
    fun = val.fun
    fatigue = val.fatigue
    money = val.money

    hash = { 'health' => health, 'mana' => mana, 'fun' => fun, 'fatigue' => fatigue, 'money' => money }
    json = hash.to_json
    File.open(@file_name, 'w') { |file| file.write(json) }
  end
end
