class CreateRawatJalanOnsites < ActiveRecord::Migration[6.1]
  def change
    create_table :rawat_jalan_onsites do |t|
      t.string :noRM
      t.date :visitDate
      t.string :policlinicID
      t.string :doctorID
      t.string :paymentID
      t.string :noJKN
      t.string :kodeJenisPeserta
      t.string :jenisPeserta
      t.string :noSEP
      t.string :noRujukan
      t.string :kodePPK
      t.string :kodeDiag

      t.timestamps
    end
  end
end
