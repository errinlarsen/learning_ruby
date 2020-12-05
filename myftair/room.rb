# frozen_string_literal: true

# Room
#
# The Room class holds the state of the World's rooms
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
