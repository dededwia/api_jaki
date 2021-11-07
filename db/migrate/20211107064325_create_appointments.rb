class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.string :noRM
      t.date :bookingDate
      t.string :policlinicID
      t.string :doctorID
      t.string :paymentID
      t.string :bookingCode
      t.string :queueNumber

      t.timestamps
    end
  end
end
