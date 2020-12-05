# frozen_string_literal: true

# Monster
#
# This class holds the states of the various monsters the Player might face
#
class Monster
  attr_accessor :hit_points, :attack_power

  def self.max_hit_points
    10
  end

  def initialize
    @hit_points   = Monster.max_hit_points
    @attack_power = 1
  end

  def alive?
    @hit_points > 0
  end

  def hurt(amount)
    @hit_points -= amount
  end

  def to_s
    "a horrible monster! garurururu"
  end

  def interact(player)
    while player.alive?
      puts "You hit the monster for #{player.attack_power} points."
      hurt(player.attack_power)
      break unless alive?
      player.hurt(@attack_power)
      puts "The monster hits you for #{@attack_power} points."
    end
  end
end
