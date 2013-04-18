class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.column :name, :string
      t.timestamps
    end
    Role.create(:name => 'Administrator')
    Role.create(:name => 'Seguradora')
    Role.create(:name => 'Cliente')
    Role.create(:name => 'Venda')
    Role.create(:name => 'Comissão')
    Role.create(:name => 'Retirada')
  end

  def self.down
    drop_table :roles
  end
end
