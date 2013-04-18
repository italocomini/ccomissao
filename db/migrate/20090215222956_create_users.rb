class CreateUsers < ActiveRecord::Migration
    def self.up
        create_table :users do |t|
            t.column :name, :string, :limit => 60, :null => false
            t.column :username, :string, :limit => 64, :null => false
            t.column :email, :string, :limit => 128, :null => false
            t.column :hashed_password, :string, :limit => 64
            t.column :enabled, :boolean, :default => true, :null => false
            t.column :last_login_at, :datetime
            t.timestamps
        end
        add_index :users, :username
    end

    def self.down
        drop_table :users
    end
end
