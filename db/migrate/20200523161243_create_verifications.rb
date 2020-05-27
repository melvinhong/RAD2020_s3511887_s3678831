class CreateVerifications < ActiveRecord::Migration[5.2]
  def change
    create_table :verifications do |t|
      t.string :fullname
      t.integer :cardnumber
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
