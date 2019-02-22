class CreateDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :details do |t|
      t.string :Name
      t.integer :Age
      t.string :Email
      t.integer :ContactDetail

      t.timestamps
    end
  end
end
