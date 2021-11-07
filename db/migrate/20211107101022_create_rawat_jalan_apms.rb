class CreateRawatJalanApms < ActiveRecord::Migration[6.1]
  def change
    create_table :rawat_jalan_apms do |t|
      t.string :mrn
      t.date :tglSJP
      t.string :jaminan
      t.string :jnsPelayanan
      t.string :namaPeserta
      t.string :bookingCode
      t.string :queueNumber
      t.string :diagnosa
      t.string :informasi
      t.string :kelasRawat
      t.string :noRujukan
      t.string :noSep
      t.string :penjamin
      t.string :poli
      t.string :poliEksekutif
      t.string :tglSep
      t.string :asuransi
      t.string :hakKelas
      t.string :jnsPeserta
      t.string :kelamin
      t.string :noKartu
      t.string :noMr
      t.string :tglLahir
      

      t.timestamps
    end
  end
end
