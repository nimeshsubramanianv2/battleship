# frozen_string_literal: true

module Battleship
  # Public: Board Class.
  class Board
    # Public: The size of the board
    BOARD_SIZE = 10

    def initialize
      @board = Grid.zero(BOARD_SIZE)
    end

    # Public: Prints the board
    #
    # Example:
    #   ..........
    #   ....TT.B..
    #   ...SSS.B..
    #   .......B..
    #   .......B.C
    #   .D.......C
    #   .D.......C
    #   .D.......C
    #   .........C
    #   ..........
    #
    # Returns nil.
    def pretty_print
      @board.to_a.each do |row|
        row.each do |value|
          print value != 0 ? value : '.'
        end
        puts ''
      end
      nil
    end

    # Public: Randomly positions the assembled fleet on the board
    def deploy_fleet(ships)
      ships.each do |ship|
        ship_placed = false
        until ship_placed
          orientation = random_orientation
          x, y = random_position(orientation, ship.size)
          if space_empty?(x, y, ship.size, orientation)
            place_ship(x, y, ship, orientation)
            ship_placed = true
          end
        end
      end
    end

    private

    # Internal: positions a ship in the board.
    #
    # x_cord      - x axis value.
    # y_cord      - y axis value.
    # ship        - An instance of the ship.
    # orientation - String representing the orientation of the ship.
    #
    # Returns nothing
    def place_ship(x_cord, y_cord, ship, orientation)
      if orientation == 'horizontal'
        (y_cord...(y_cord + ship.size)).each do |i|
          @board[x_cord, i] = ship.mnemonic
        end
      else
        (x_cord...(x_cord + ship.size)).each do |i|
          @board[i, y_cord] = ship.mnemonic
        end
      end
      nil
    end

    # Internal: checks if a ship can be placed in a particular position.
    #
    # x_cord      - x axis value.
    # y_cord      - y axis value.
    # size        - The size of the ship.
    # orientation - String representing the orientation of the ship.
    #
    # Returns true if a ship can be placed in the location, false otherwise.
    def space_empty?(x_cord, y_cord, size, orientation)
      if orientation == 'horizontal'
        (y_cord...(y_cord + size)).each do |i|
          return false if @board[x_cord, i] != 0
        end
      else
        (x_cord...(x_cord + size)).each do |i|
          return false if @board[i, y_cord] != 0
        end
      end
      true
    end

    # Internal: Randomly generates coordinates to place the ship.
    #
    # orientation - String representing the orientation of the ship.
    # ship_size   - The size of the ship
    #
    # Returns an Array containing randomly selected coordinates for the x and y axis (ex: [x, y]).
    def random_position(orientation, ship_size)
      if orientation == 'horizontal'
        rand_y = rand_no
        offset = (rand_y + ship_size)
        y = rand_y + ship_size >= BOARD_SIZE ? offset % (BOARD_SIZE - 1) : rand_y
        x = rand_no
      else
        rand_x = rand_no
        offset = (rand_x + ship_size)
        x = rand_x + ship_size >= BOARD_SIZE ? offset % (BOARD_SIZE - 1) : rand_x
        y = rand_no
      end
      [x, y]
    end

    # Internal: Generates a random from 0 to 9
    #
    # Returns an Integer number 0 - 9
    def rand_no
      rand(0...BOARD_SIZE)
    end

    # Internal: picks an orientation in random
    #
    # Returns a String representing the orientation.
    def random_orientation
      rand(0..1).zero? ? 'horizontal' : 'vertical'
    end
  end
end
