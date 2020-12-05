# frozen_string_literal: true

require_relative 'world'
require_relative 'player'
require_relative 'room'
require_relative 'item'
require_relative 'monster'

# Game
#
# The Game object will "drive", or "control" the game for the player; describing
# the current status, prompting the player, collecting their input, and finally
# adjusting the game state based on the results. This continues until the Player
# is no longer `alive?`
#
class Game
  def self.actions
    %i[map north east south west look fight take status]
  end

  def initialize
    @world = World.new
    @player = Player.new
  end

  def start
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
    when :map          then @world.print_status
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
game.start

