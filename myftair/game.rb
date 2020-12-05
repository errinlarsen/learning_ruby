# frozen_string_literal: true

# Player
#
# This class hold's the player's state in the game
#
class Player
  attr_accessor :hit_points, :attack_power
  attr_accessor :x_coord, :y_coord

  def self.max_hit_points
    100
  end

  def initialize
    @hit_points = Player.max_hit_points
    @attack_power      = 1
    @x_coord, @y_coord = 0, 0
  end

  def alive?
    @hit_points > 0
  end

  def hurt(amount)
    @hit_points -= amount
  end

  def heal(amount)
    @hit_points += amount
    @hit_points = [@hit_points, Player.max_hit_points].min
  end

  def print_status
    puts "*" * 80
    puts "HP: #{@hit_points}/#{Player.max_hit_points}"
    puts "AP: #{@attack_power}"
    puts "*" * 80
  end
end


# Item
#
# This class holds the state of items the Player might collect
#
class Item

  def self.types
    [:potion, :sword]
  end

  attr_accessor :type

  def initialize
    @type = Item.types.sample
  end

  def interact(player)
    case @type
    when :potion
      puts "You pick up #{self}."
      player.heal(10)
    when :sword
      puts "You pick up #{self}."
      player.attack_power += 1
    end
  end

  def to_s
    "a shiny awesome #{@type.to_s}"
  end
end
