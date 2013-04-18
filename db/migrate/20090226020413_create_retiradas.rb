class CreateRetiradas < ActiveRecord::Migration
  def self.up
    create_table :retiradas do |t|
      t.integer :user_id
      t.date :data_retirada
      t.float :valor_retirada

      t.timestamps
    end
  end

  def self.down
    drop_table :retiradas
  end
end
