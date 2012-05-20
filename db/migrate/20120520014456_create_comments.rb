class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id, :null => false
      t.integer :project_id, :null => false
      t.string :message, :null => false
      t.timestamps
    end
    add_index :comments, :project_id
    execute <<-SQL
      alter table comments add constraint fk_comments_user
        foreign key (user_id) references users on delete cascade on update cascade;
      alter table comments add constraint fk_comments_project
        foreign key (project_id) references projects on delete cascade on update cascade;
    SQL
  end
end
