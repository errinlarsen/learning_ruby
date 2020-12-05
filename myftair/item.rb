# frozen_string_literal: true

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
