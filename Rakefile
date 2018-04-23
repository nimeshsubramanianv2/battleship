# frozen_string_literal: true

# This task reloads the gem
task :console do
  require 'pry'
  require_relative 'lib/battleship'

  def reload!
    files = $LOADED_FEATURES.select { |feat| feat =~ %r{/battleship/} }
    files.each { |file| load file }
  end

  ARGV.clear
  Pry.start
end
