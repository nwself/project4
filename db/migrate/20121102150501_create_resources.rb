class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :content
      t.string :permissions
      t.integer :user_project_rel_id

      t.timestamps
    end
  end
end
