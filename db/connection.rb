require "active_record"

ActiveRecord::Base.establish_connection(
  :adapter => "postgresql",
  :host => "localhost",
  :database => "ldl_db"
)