class CreateLotes < ActiveRecord::Migration[5.1]
  def change
    create_table :lotes do |t|
      t.date :data
      t.boolean :ativo

      t.timestamps
    end
  end
end
