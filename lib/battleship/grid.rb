# frozen_string_literal: true

require 'matrix'

module Battleship
  # Public: Grid class.
  # This class is helpful in forming the 2D Array of the board.
  class Grid < Matrix
    # This method in the super class is private. We make it private to enable
    # us to mutate a Grid object.
    public :[]=
  end
end
