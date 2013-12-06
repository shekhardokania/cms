class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.string :email
      t.integer :age
      t.string :sex
      t.string :phone

      t.timestamps
    end
  end
end
