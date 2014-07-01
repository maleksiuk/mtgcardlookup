class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name, :null => false
      t.string :cardtype, :null => false
      t.string :bodytext, limit: 1000
      t.string :power, limit: 3
      t.string :toughness, limit: 3
      t.integer :multiverseid, :null => false

      t.timestamps
    end
  end
end
