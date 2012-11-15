class CreateTaskUserProjRels < ActiveRecord::Migration
  def change
    create_table :task_user_proj_rels do |t|
      t.references :task_bug
      t.references :user_project_rel

      t.timestamps
    end
    add_index :task_user_proj_rels, :task_bug_id
    add_index :task_user_proj_rels, :user_project_rel_id
  end
end
