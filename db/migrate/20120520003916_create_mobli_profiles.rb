class CreateMobliProfiles < ActiveRecord::Migration
  def change
    create_table :mobli_profiles do |t|
      t.string :key, :null => false
      t.string :atoken
      t.string :asecret
      t.integer :user_id, :null => false
      t.timestamps
    end
    execute <<-SQL
      alter table mobli_profiles add constraint fk_mobli_profiles_user
        foreign key (user_id) references users on delete set null on update cascade;
    SQL
    add_index :mobli_profiles, :key, :unique => true
    add_index :mobli_profiles, :user_id, :unique => true
  end
end
