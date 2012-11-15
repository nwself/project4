class CreateProjectResourceRels < ActiveRecord::Migration
  def change
    create_table :project_resource_rels do |t|
        t.references :project
        t.references :resource
      t.timestamps
    end
  end
end
