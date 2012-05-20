class CreateOccupations < ActiveRecord::Migration
  def change
    create_table :occupations do |t|
      t.string :name, :null => false
      t.timestamps
    end
    add_column :users, :occupation_id, :integer
    execute <<-SQL
      alter table users add constraint fk_users_occupation
        foreign key (occupation_id) references occupations on delete set null on update cascade;
    SQL
    if !::Rails.env.test?
      [
        { :name => 'Designer' },
        { :name => 'Developer' },
        { :name => 'Business Person' },
        { :name => 'Investor' }
      ].each{ |r| Occupation.create!(r) }
    end
  end
end
