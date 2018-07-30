class DeleteOnUserDelete < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :encounters, :patients

    add_foreign_key :encounters, :patients, on_delete: :cascade
  end
end
