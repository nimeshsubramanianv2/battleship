# frozen_string_literal: true

require_relative 'lib/battleship'

# lists all the battleship pieces
list_of_ships = [{ name: 'tug', mnemonic: 'T', size: 2 },
                 { name: 'destroyer', mnemonic: 'D', size: 3 },
                 { name: 'submarine', mnemonic: 'S', size: 3 },
                 { name: 'battleship', mnemonic: 'B', size: 4 },
                 { name: 'cruiser', mnemonic: 'C', size: 5 }]

# assembles the fleet
fleet = Battleship::Fleet.assemble(list_of_ships)

# creates the board
battleship_layout = Battleship::Board.new

# deploys the ships in the board
battleship_layout.deploy_fleet(fleet.ships)

# prints the board
battleship_layout.pretty_print
