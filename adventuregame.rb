# frozen_string_literal: true

# == Adventure \Game
#
# This is gonna be such a great game! Here's some details...
# - TODO: add details
#
# == Running the game
#
# To run the game, ... (TODO: moar details needed; etc.)

#GAME START

# Player
#
# TODO: describe what this class is/does/is-responsible-for
#
# TODO: you might add an example of using this class here, too
class Player
  attr_accessor :hit_points
  attr_accessor :attack_power
  attr_accessor :chance_to_hit

  MAX_HIT_POINTS = 100

  # A predicate method to check whether a Player is alive or not
  # - returns: Boolean (true/false)
  def alive?
    hit_points > 0
  end

  # Performs an attack on the indicated target
  #
  # == Arguments
  #
  # +target+: +Monster+
  # - an instance of a Monster that the player is attacking
  def attack(target)
    # 1. roll chance to hit
    # 2. compare chance to hit to monster stats
    # 3. deal damage / miss
  end

  # TODO: What's dis do?
  def hurt_self(amount)
    @hit_points -= amount
  end

  # TODO: wats dat do?
  def heal_self(amount)
    @hit_points += amount
  end
end

# Item
# - describe what this class is/does/is-responsible-for
# - docs/comments go here!
class Item
end


# Monster
# - describe what this class i/does/is-responsible-for
# - docs/comments go here!
class Monster
  attr_accessor :hit_points
  attr_accessor :attack_power
  attr_accessor :chance_to_hit
  attr_accessor :type

  MONSTER_TYPES = %q[Rat Goblin Troll]

  def intitialize
    # monster = Monster.new
    @type = MONSTER_TYPES.sample

    case @type
    when 'Rat'
      @chance_to_hit = 5
      @hit_points = 4

      # FIXME: bug (below)...
      # - maybe define monster attack power outside initialize,
      # - maybe in attack player?
      @attack_power = rand(1..2)

    when 'Goblin'
      @chance_to_hit = 8
      @hit_points = 10
      @attack_power = rand(2..5)

    when 'Troll'
      @chance_to_hit = 12
      @hit_points = 13
      @attack_power = rand(3..8)

    else
      raise 'Something went wrong! We should never get here'
    end
  end

  def alive?
    hit_points > 0
  end

  def hurt_self(amount)
    @hit_points -= amount
  end
end
