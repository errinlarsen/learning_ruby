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

# World
#
# The "world" is a fixed 10 x 10 grid.
#
# [
#   [room 0,0], [room 0,1], [room 0,2], # ...
#   [room 1,0], [room 1,1], [room 1,2], # ...
#   [room 2,0], [room 2,1], [room 2,2], # ...
#   [room 3,0], [room 3,1], [room 3,2], # ...
#   # ...
# ]
#
class World
  def self.width
    10
  end

  def self.height
    10
  end

  def initialize
    @rooms = Array.new(World.height, Array.new(World.width))
  end

  def move_entity_north(entity)
    entity.y_coord -= 1 if entity.y_coord > 0
  end

  def move_entity_south(entity)
    entity.y_coord += 1 if entity.y_coord < World.height - 1
  end

  def move_entity_east(entity)
    entity.x_coord += 1 if entity.x_coord < World.width - 1
  end

  def move_entity_west(entity)
    entity.x_coord -= 1 if entity.x_coord > 0
  end

  def get_room_of(entity)
    @rooms[entity.x_coord][entity.y_coord] ||= Room.new
  end
end

# Room
#
# The Room class is what populates the World's "cells"
#
class Room
  attr_accessor :size, :content

  def initialize
    @content   = get_content
    @size      = get_size
    @adjective = get_adjective
  end

  def interact(player)
    return unless @content
    @content.interact(player)
    @content = nil
  end

  def to_s
    "You are in a #{@size} room. It is #{@adjective}."
  end

  private
  def get_content
    [Monster, Item].sample.new
  end

  def get_size
    %w[small medium large].sample
  end

  def get_adjective
    %w[pretty ugly hideous].sample
  end
end

# TODO: once you break this file into multiple files, the following will require
# all the pieces:
#
# Dir["lib/**.*"].each { |file| require_relative file }

class Game
  def self.actions
    %i[north east south west look fight take status]
  end

  def initialize
    @world = World.new
    @player = Player.new
  end

  def play
    start_game
  end

  private
  def start_game
    while @player.alive?
      @current_room = @world.get_room_of(@player)

      print_status

      players_input = get_player_input
      next unless Game.actions.include? players_input

      take_action(players_input)
    end
  end

  def get_player_input
    print "What's the plan, Stan? "
    gets.chomp.to_sym
  end

  def print_status
    puts "You are at map coordinates [#{@player.x_coord}, #{@player.y_coord}]"
    puts @current_room
    puts "You see #{@current_room.content}." if @current_room.content
  end

  def take_action(action)
    case action
    when :look         then print_status
    when :north        then @world.move_entity_north(@player)
    when :east         then @world.move_entity_east(@player)
    when :south        then @world.move_entity_south(@player)
    when :west         then @world.move_entity_west(@player)
    when :fight, :take then @current_room.interact(@player)
    when :status       then @player.print_status
    end
  end
end

game = Game.new
game.play

