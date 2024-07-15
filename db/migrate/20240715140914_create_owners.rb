class CreateOwners < ActiveRecord::Migration[7.1]
  def change
    create_table :owners, id: :uuid do |t|
      t.string :name, null: false, index: true
      t.string :ssn, null: false, index: true

      t.timestamps
    end
  end
end
