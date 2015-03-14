class CreateContentsUsers < ActiveRecord::Migration
  def change
    create_table :contents_users, id: false do |t|
      t.integer :content_id
      t.integer :user_id
    end
    
    add_index :contents_users, [:content_id, :user_id]
  end
end
