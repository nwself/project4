class CreateUserProjectRels < ActiveRecord::Migration
  def change
    create_table :user_project_rels do |t|
      t.references :user
      t.references :project
      t.string :role

      t.timestamps
    end
    add_index :user_project_rels, :user_id
    add_index :user_project_rels, :project_id
  end
end
