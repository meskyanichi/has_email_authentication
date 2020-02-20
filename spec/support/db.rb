ActiveRecord::Base.establish_connection(
  :adapter  => "sqlite3",
  :database => ":memory:",
)

class Schema < ActiveRecord::Migration[5.0]

  def change
    create_table :users do |t|
      t.string :email
    end
  end
end

Schema.new.change
