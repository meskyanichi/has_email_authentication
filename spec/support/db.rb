ActiveRecord::Base.establish_connection(
  adapter: "sqlite3", database: ":memory:"
)

class Schema < ActiveRecord::Migration

  def change
    create_table :users do |t|
      t.string :email
    end
  end
end

silence_stream(STDOUT) do
  Schema.new.change
end
