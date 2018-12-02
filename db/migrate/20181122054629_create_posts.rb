class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user
      t.text :content
      t.float :lat, default: 37.384143664
      t.float :lng, default: -122.10104227

      t.timestamps
    end
  end
end
