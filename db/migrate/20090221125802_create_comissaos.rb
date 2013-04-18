class CreateComissaos < ActiveRecord::Migration
  def self.up
    create_table :comissaos do |t|
      t.integer :venda_id
      t.date :data
      t.integer :apolice
      t.integer :parcela
      t.float :recebido
      t.float :cancelado
      t.float :retido
      t.float :comissao

      t.timestamps
    end
  end

  def self.down
    drop_table :comissaos
  end
end
