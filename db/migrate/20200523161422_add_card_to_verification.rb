class AddCardToVerification < ActiveRecord::Migration[5.2]
  def change
    add_column :verifications, :card, :string
  end
end
