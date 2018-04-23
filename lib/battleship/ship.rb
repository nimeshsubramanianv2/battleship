# frozen_string_literal: true

module Battleship
  # public: Ship class, used for encapsulating information about a ship.
  class Ship
    attr_reader :name, :size, :mnemonic

    def initialize(name:, mnemonic:, size:)
      @name = name
      @mnemonic = mnemonic
      @size = size
    end
  end
end
