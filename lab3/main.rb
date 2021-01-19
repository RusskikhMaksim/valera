require_relative 'actions'
require_relative 'valera'
require_relative 'load_save/load_game'
require_relative 'load_save/save_game'
require_relative 'load_config'
require_relative 'print_info'

class Main
  def initialize
    @valerka = Valera.new
    @actions = Actions.new
    @loader = LoadGame.new
    @saver = SaveGame.new
    @config = Config.new
    @info_manager = PrintInfo.new
  end

  def menu
    @still_playing = true
    puts 'Добро пожаловать в игру Маргинал Валера'
    while @still_playing == true
      @still_run_game = true
      puts "Выберите действие:\n1 - начать игру\n2 - загрузить сохранение и продолжить игру\n3 - выход\n\n"
      choice = gets.chomp.to_i
      case choice
      when 1
        @config.load_conf(@valerka)
        run_game
      when 2
        @valerka = @loader.load(@valerka)
        run_game
      when 3
        # exit
        @still_playing = false
      end
    end
  end

  def run_game
    while @still_run_game == true
      @still_run_game = @valerka.check_params
      @info_manager.print_stats(@valerka)
      @valerka.print_game_over unless @still_run_game
      break unless @still_run_game

      @info_manager.print_actions
      player_choice = gets.chomp.to_i

      case player_choice
      when 9
        @info_manager.print_actions_info
      when 10
        @still_run_game = false
      else
        actions_manager_one(player_choice)
      end

      @saver.save_data(@valerka)
    end
  end

  def actions_manager_one(player_choice)
    case player_choice
    when 1
      @valerka = @actions.go_work(@valerka)
    when 2
      @actions.chill(@valerka)
    when 3
      @actions.drink_vine(@valerka)
    when 4
      @actions.drink_in_bar(@valerka)
    else
      actions_manager_two(player_choice)
    end
  end

  def actions_manager_two(player_choice)
    case player_choice
    when 5
      @actions.drink_with_marginal(@valerka)
    when 6
      @actions.sing_in_metro(@valerka)
    when 7
      @actions.sleep(@valerka)
    when 8
      @actions.play_dota(@valerka)
    end
  end
end

m = Main.new
m.menu
# class Valera
#  a = actions.new
# end
#
# class actions
#   v = Valera.new
# end
#
#
#
#
#
#
#
# class MainMenu
#   def menu
#   #something
#   end
#
#   def initialize
#
#   end
#   def ingame_menu
#     #while
#   end
# end
