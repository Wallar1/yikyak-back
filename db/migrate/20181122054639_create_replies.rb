class CreateReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :replies do |t|
      t.text :content
      t.string :icon

      t.references :post
      t.references :user
      t.timestamps
    end
  end
end
