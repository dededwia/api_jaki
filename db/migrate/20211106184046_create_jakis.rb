class CreateJakis < ActiveRecord::Migration[6.1]
  def change
    create_table :jakis do |t|
      t.string :noRM
      t.string :name
      t.string :birthDate
      t.string :nik
      t.string :sex
      t.string :noJKN
      t.string :phone

      t.timestamps
    end
  end
end
