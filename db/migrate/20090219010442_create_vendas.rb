class CreateVendas < ActiveRecord::Migration
  def self.up
    create_table :vendas do |t|
      t.integer :cliente_id
      t.integer :seguradora_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :vendas
  end
end
