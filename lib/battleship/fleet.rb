# frozen_string_literal: true

module Battleship
  # Public:Fleet class
  class Fleet
    attr_reader :ships

    def initialize(ships)
      @ships = ships
    end

    class << self
      # Public: Factory method to create an instance of Fleet.
      #
      # ship_list  - An Array of Hashes containing meta-info on the ship.
      #              The Hash should have the following keys:
      #              :name     - The class of ship
      #              :mnemonic - The mnemonic of the ship
      #              :size     - The size of the ship
      #
      # Returns an instance of Fleet.
      def assemble(ship_list)
        raise 'ship_list is empty!!' if ship_list.empty?

        ships = ship_list.collect do |ship|
          Ship.new(name: ship[:name],
                   mnemonic: ship[:mnemonic],
                   size: ship[:size])
        end
        new(ships)
      end
    end
  end
end
