# frozen_string_literal: true

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

  # The following method WAS:
  # - `@rooms[entity.y_coord][entity.x_coord] ||= Room.new`
  def get_room_of(entity)
    entitys_room = @rooms[entity.y_coord][entity.x_coord]

    if entitys_room.nil?
      return @rooms[entity.y_coord][entity.x_coord] = Room.new
    else
      return entitys_room
    end
  end

  def print_status
    puts "*" * 80

    0.upto(9) do  |y|
      0.upto(9) do |x|
        print "[ #{@rooms[y][x].object_id} ]"
      end
      puts
    end

    puts "*" * 80
  end
end
