class Actions
  def go_work(valerka)
    if (valerka.mana < 50) && (valerka.fatigue < 10)
      puts "Вы поработали и устали.\n\n"
      valerka.stat_set_mana(valerka.mana - 30)
      valerka.stat_set_fun(valerka.fun - 5)
      valerka.stat_set_fatigue(valerka.fatigue + 70)
      valerka.money += 100
    else
      puts "Действие недоступно: вы пьяны или устали.\n\n"
    end
    valerka
  end

  def chill(valerka)
    valerka.stat_set_mana(valerka.mana - 10)
    valerka.stat_set_fun(valerka.fun + 1)
    valerka.stat_set_fatigue(valerka.fatigue + 10)
    puts "Вы едины с природой.\n\n"
    valerka
  end

  def drink_vine(valerka)
    if valerka.money < 20
      puts "Действие недоступно: у вас недостаточно $.\n\n"
    else
      valerka.stat_set_health(valerka.health - 5)
      valerka.stat_set_mana(valerka.mana + 30)
      valerka.stat_set_fun(valerka.fun - 1)
      valerka.stat_set_fatigue(valerka.fatigue + 10)
      valerka.money -= 20
      puts "Сериал был хорош.\n\n"
    end
    valerka
  end

  def drink_in_bar(valerka)
    if valerka.money < 100
      puts "Действие недоступно: у вас недостаточно $.\n\n"
    else
      valerka.stat_set_health(valerka.health - 10)
      valerka.stat_set_mana(valerka.mana + 60)
      valerka.stat_set_fun(valerka.fun + 1)
      valerka.stat_set_fatigue(valerka.fatigue + 40)
      valerka.money -= 100
      puts "Вы напились в баре.\n\n"
    end
    valerka
  end

  def drink_with_marginal(valerka)
    if valerka.money < 150
      puts "Действие недоступно: у вас недостаточно $.\n\n"
    else
      valerka.stat_set_health(valerka.health - 80)
      valerka.stat_set_mana(valerka.mana + 90)
      valerka.stat_set_fun(valerka.fun + 5)
      valerka.stat_set_fatigue(valerka.fatigue + 80)
      valerka.money -= 150
      puts "Вы напились в компании маргинальных личностей.\n\n"
    end
    valerka
  end

  def sing_in_metro(valerka)
    puts 'Вы спели в метро.'
    if (valerka.mana > 40) && (valerka.mana < 70)
      valerka.money += 50
      puts "Вы отлично выступили в метро и вам подкинули $.\n\n"
    end
    valerka.stat_set_mana(valerka.mana + 10)
    valerka.stat_set_fun(valerka.fun + 1)
    valerka.stat_set_fatigue(valerka.fatigue + 20)
    valerka.money += 10
    valerka
  end

  def sleep(valerka)
    puts "Вы поспали.\n\n"
    valerka.stat_set_mana(valerka.mana - 50)
    valerka.stat_set_fatigue(valerka.fatigue - 70)
    valerka
  end

  def sleep_condition(valerka)
    if valerka.mana < 30
      valerka.stat_set_health(valerka.health + 90)
      puts "Чуствуете прилив сил.\n\n"
    elsif valerka.mana > 70
      valerka.stat_set_fun(valerka.fun - 3)
      puts "Как живой, но не живой.\n\n"
    end
  end

  def play_dota(valerka)
    win = rand(100)
    if win > 50
      puts "Вы выиграли.\n\n"
      valerka.stat_set_fun(valerka.fun + 3)
    else
      puts "Вы проиграли.\n\n"
      valerka.stat_set_health(valerka.health - 10)
      valerka.stat_set_fun(valerka.fun - 2)
    end
    valerka.stat_set_fatigue(valerka.fatigue + 10)
    valerka
  end
end
