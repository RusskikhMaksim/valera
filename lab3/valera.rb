class Valera
  attr_accessor :health, :mana, :fun, :fatigue, :money

  def set_params(health, mana, fun, fatigue, money)
    @hp = health
    @mp = mana
    @fun = fun
    @fatigue = fatigue
    @money = money
  end

  def check_params
    check_fatigue
    check_fun
    if check_hp
      true
    else
      false
    end
  end

  def check_hp
    !@health.negative?
  end

  def check_fatigue
    if @fatigue > 100
      puts "Вы переутомились, что привело к ухудшению вашего здоровья: hp -20\n\n"
      @health -= 20
    end
    true
  end

  def check_fun
    if @fun < -10
      puts "В последнее время вы испытываете слишком много стресса, что привело к ухудшению вашего здоровья: hp -20\n\n"
      @health -= 20
    end
    true
  end

  def print_game_over
    puts 'Распутная жизнь на широкую ногу не могла остаться без последствий, вы погибли'
  end

  def stat_set_health(amount)
    amount = 100 if amount > 100
    @health = amount
  end

  def stat_set_mana(amount)
    amount = 0 if amount.negative?
    amount = 100 if amount > 100
    @mana = amount
  end

  def stat_set_fatigue(amount)
    amount = 0 if amount.negative?
    @fatigue = amount
  end

  def stat_set_fun(amount)
    amount = 10 if amount > 10
    @fun = amount
  end
end
# val = Valera.new(100, 0, 0, 0, 0)
#
# hash = { 'hp' => val.hp, 'mp' => val.mp, 'fun' => val.fun, 'fatigue' => val.fatigue, 'money' => val.money}
#
# puts hash
