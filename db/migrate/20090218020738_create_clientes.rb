class CreateClientes < ActiveRecord::Migration
  def self.up
    create_table :clientes do |t|
      t.string :nome
      t.string :telefone

      t.timestamps
    end
  end

  def self.down
    drop_table :clientes
  end
end
