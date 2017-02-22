class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :name, null: false
      t.jsonb :logins, default: {}, null: false

      t.timestamps
    end

    add_index :players, :logins, using: :gin
  end
end
