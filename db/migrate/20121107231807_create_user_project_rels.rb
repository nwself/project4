class CreateUserProjectRels < ActiveRecord::Migration
  def change
<<<<<<< HEAD:db/migrate/20121102150341_create_user_project_rels.rb
    create_table :project_user do |t|
      t.integer :user_id
      t.integer :project_id
=======
    create_table :user_project_rels do |t|
      t.references :user
      t.references :project
>>>>>>> new_branch_name:db/migrate/20121107231807_create_user_project_rels.rb
      t.string :role

      t.timestamps
    end
    add_index :user_project_rels, :user_id
    add_index :user_project_rels, :project_id
  end
end
