class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :user_id,:patient_id
      t.datetime :start_time
      t.datetime :end_time
      t.string :title
      t.boolean :allday
      t.timestamps
    end
  end
end
