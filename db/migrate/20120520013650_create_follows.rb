class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer :user_id
      t.integer :project_id
      t.timestamps
    end
    add_index :follows, [:user_id, :project_id], :unique => true
    add_index :follows, :project_id
    execute <<-SQL
      alter table follows add constraint fk_follows_user
        foreign key (user_id) references users on delete cascade on update cascade;
      alter table follows add constraint fk_follows_project
        foreign key (project_id) references projects on delete cascade on update cascade;
    SQL
  end
end
