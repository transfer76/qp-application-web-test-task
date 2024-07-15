class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies, id: :uuid do |t|
      t.string :name, null: false, index: true
      t.string :country, null: false, index: true
      t.string :phone
      t.string :owner_ids, array: true, default: []

      t.timestamps
    end
  end
end
