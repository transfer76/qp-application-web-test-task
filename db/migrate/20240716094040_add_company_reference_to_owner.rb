class AddCompanyReferenceToOwner < ActiveRecord::Migration[7.1]
  disable_ddl_transaction!

  def change
    add_reference :owners, :company, index: { algorithm: :concurrently }, type: :uuid
  end
end
