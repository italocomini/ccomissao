class CreateSeguradoras < ActiveRecord::Migration
  def self.up
    create_table :seguradoras do |t|
      t.string :nome

      t.timestamps
    end
  end

  def self.down
    drop_table :seguradoras
  end
end
