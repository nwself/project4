class CreateTaskUserProjRels < ActiveRecord::Migration
  def change
    create_table :task_user_proj_rels do |t|
      t.integer :task_id
      t.integer :user_project_rel

      t.timestamps
    end
  end
end
