class CreateTaskBugs < ActiveRecord::Migration
  def change
    create_table :task_bugs do |t|
      t.string :title
      t.string :status
      t.string :priority
      t.date :due_date
      t.date :estimated_date
      t.float :percentage_completed
      t.string :task_or_bug

      t.timestamps
    end
  end
end
