class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.integer :value

      t.references :post
      t.references :reply
      t.references :user
      t.timestamps
    end
  end
end
