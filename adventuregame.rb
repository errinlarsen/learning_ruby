#GAME START
class Player
  @hit_points
  @attack_power
  @chance_to_hit
  
  MAX_HIT_POINTS = 100
  
  def alive?
    hit_points > 0
  end
  
  def attack_monster
    #roll chance to hit
    #compare chance to hit to monster stats
    #deal damage / miss
  end
  
  def hurt_player(amount)
    @hit_points = @hit_points - amount
  end
  
  def heal_player(amount)
    @hit_points = @hit_points + amount
  end
  
    
  
end

class Item
end

class Monster
  monsters = ["Rat", "Goblin", "Troll"]
  @type
  @chance_to_hit
  @attack_power
  @hit_points
  
  def intitialize
    monster = Monster.new
    @type = monsters.sample
    
    if @type == "Rat" 
      @chance_to_hit = 5
      @hit_points = 4
      @attack_power = rand(1..2) #bug, maybe define monster attack power outside initialize, maybe in attack player?
    elsif @type == "Goblin"
      @chance_to_hit = 8
      @hit_points = 10
      @attack_power = rand(2..5)
    elsif @type == "Troll"
      @chance_to_hit = 12
      @hit_points = 13
      @attack_power = rand(3..8)
    else 
      puts "We should never get here"
    end
    
  
  end
  
  def alive?
    @hit_points > 0
  end
  
  def hurt_monster(amount)
    @hit_points = @hit_points - amount
  end
  
  end
  