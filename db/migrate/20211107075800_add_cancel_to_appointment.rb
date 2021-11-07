class AddCancelToAppointment < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :cancel, :string
  end
end
