require "pry"
require "sqlite3"
require "active_record"

ROOT_PATH = File.expand_path("../../..", __FILE__)
SPEC_PATH = File.join(ROOT_PATH, "spec")

I18n.enforce_available_locales = true

require "#{SPEC_PATH}/support/db"
