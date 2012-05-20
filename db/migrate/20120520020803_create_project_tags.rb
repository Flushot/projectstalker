class CreateProjectTags < ActiveRecord::Migration
  def change
    create_table :project_tags do |t|
      t.integer :project_id, :null => false
      t.integer :tag_id, :null => false
    end
    add_index :project_tags, [:project_id, :tag_id], :unique => true
    add_index :project_tags, :project_id
    execute <<-SQL
      alter table project_tags add constraint fk_project_tags_project
        foreign key (project_id) references projects on delete cascade on update cascade;
      alter table project_tags add constraint fk_project_tags_tag
        foreign key (tag_id) references tags on delete cascade on update cascade;
    SQL
  end
end
