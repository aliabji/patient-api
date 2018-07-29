class AddTables < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :first, null: false
      t.string :middle, null: false
      t.string :last, null: false
      t.integer :weight
      t.integer :height
      t.string :MRN, null: false
    end

    create_table :encounters do |t|
      t.integer :patient_id, null: false
      t.integer :visit_number, null: false
      t.datetime :admitted_at, null: false
      t.datetime :discharged_at
      t.text :location
      t.string :room
      t.string :bed
    end

    add_foreign_key :encounters, :patients
  end
end
