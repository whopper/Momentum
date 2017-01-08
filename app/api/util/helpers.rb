require 'grape'
require 'sequel'
require 'yaml'

module Util
  def self.settings(key)
    env = ENV['RACK_ENV'] ||= 'development'
    @settings ||= YAML.load_file(File.join('config', 'settings.yml'))[env.to_sym]
    @settings[key]
  end

  def self.connect_db
    db = Sequel.connect(settings(:database))

    unless db
      error! 'Unable to connect to the database!', 500
    end

    db
  end
end
