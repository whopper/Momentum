require 'rake'
require 'yaml'
require 'sequel'

require_relative 'app/api/util/helpers'

ROOT_DIR = File.expand_path(File.dirname(__FILE__)) unless defined? ROOT_DIR

#[ ".", "#{ROOT_DIR}/app", "#{ROOT_DIR}/lib" ].each do |p|
#  $LOAD_PATH.unshift(p) unless $LOAD_PATH.include?(p)
#end

desc 'Run all migrations'
task :migrate do
  Sequel.extension :migration
  db = Util::connect_db
  Sequel::Migrator.run(db, File.join(ROOT_DIR, 'db', 'migrations'))
end
