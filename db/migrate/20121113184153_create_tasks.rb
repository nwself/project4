class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :task_or_bug
      t.string :status
      t.string :priority
      t.float :percentage_completed
      t.date :due_date
      t.date :estimated_date

      t.timestamps
    end
  end
end
