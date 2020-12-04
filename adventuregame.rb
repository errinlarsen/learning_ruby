# frozen_string_literal: true
# REVIEW: ☝️  this is a "magic" comment; I'll explain later

# REVIEW: Get used to documenting your code as you go. It will help you. It will
# also cause problems down the road, so let's talk about it. I'll provide some
# examples in this file...

# REVIEW: My "code review" comments will be marked with "REVIEW:"

# REVIEW: at the opening of a file (up here, at the top), should be some
# explanation of _THIS_ file and what it's for in general...

# == Adventure \Game
#
# This is gonna be such a great game! Here's some details...
# - TODO: add details
#
# == Running the game
#
# To run the game, ... (TODO: moar details needed; etc.)


#GAME START

# REVIEW: A class gets some documentation and explanation, too


# Player
#
# TODO: describe what this class is/does/is-responsible-for
# - using ENGLISH(!)
# - i.e. "The Player class will represent the state of the Player's character
#   within the Game"
#
# TODO: you might add an example of using this class here, too
# Example:
#   player_character = Player.new
#   player.hit_points = 5
#   player.hurt_self(4)
#   player.alive?       # => true
#   player.hit_points   # => 1
#   player.hurt_self(2)
#   player.alive?       # => false
class Player
  attr_accessor :hit_points
  attr_accessor :attack_power
  attr_accessor :chance_to_hit

  MAX_HIT_POINTS = 100

  # REVIEW: PUBLIC methods represent your new Class' API (Application
  # Programming Interface). As such, they are literally the list of messages you
  # can send to an instance of this Class. They should be documented...
  # - TODO: 1) Describe what it does...
  # - TODO: 2) it's helpful to document the expected return values...

  # A predicate method to check whether a Player is alive or not
  # - returns: Boolean (true/false)
  def alive?
    hit_points > 0
  end

  # Performs an attack on the indicated target
  #
  # :args: target
  #
  # == Arguments
  #
  # - +target+: Monster instance of a Monster that the player is attacking
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


# REVIEW: Added some comments
# Item
# - describe what this class is/does/is-responsible-for
# - docs/comments go here!
class Item
  # REVIEW: Do we really need this class yet?
end


# REVIEW: Added comments
# Monster
# - describe what this class i/does/is-responsible-for
# - docs/comments go here!
class Monster
  attr_accessor :hit_points    # REVIEW: Putting these accessors, or instance
  attr_accessor :attack_power  # variables, in the same order as is used in the
  attr_accessor :chance_to_hit # `Player` class helps future devs (like you)
  attr_accessor :type          # understand things better

  MONSTER_TYPES = %q[Rat Goblin Troll]

  def intitialize
    # monster = Monster.new  <-- REVIEW: unnecessary; broken, even
    @type = MONSTER_TYPES.sample

    # REVIEW: I made this a `case` statement 'cause I hate if/elsif/else blocks
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

    else  # REVIEW: notice, it still has an else, though :-(
      # REVIEW I made this raise an exception for Reasons™
      raise 'Something went wrong! We should never get here'
    end
  end

  # REVIEW: When you create an accessor (e.g. `attr_accessor :hit_points`), then
  # you can use that accessor method (`#hit_points`) instead of directly
  # referring to the underlying `@hit_points` variable. There are Reasons™, and
  # we'll talk about it later.
  def alive?
    hit_points > 0
  end

  def hurt_self(amount)
    @hit_points -= amount
  end
end
