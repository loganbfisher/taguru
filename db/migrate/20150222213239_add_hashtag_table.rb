class AddHashtagTable < ActiveRecord::Migration
  def change
    create_table :hashtags do |t|
      t.integer :user_id
      t.string :name
    end
  end
end
