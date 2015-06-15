require "rspec"
require "pg"
require "museum"
require "artwork"
require "pry"

DB = PG.connect({:dbname => 'museum_tracker_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM museums *;")
    DB.exec("DELETE FROM artworks *;")
  end
end
