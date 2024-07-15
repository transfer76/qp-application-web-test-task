class CreateCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :companies, id: :uuid do |t|
      t.string :name, null: false, index: true
      t.string :country, null: false, index: true
      t.string :phone
      t.string :owner_id, type: :uuid, null: false, index: true

      t.timestamps
    end
  end
end
