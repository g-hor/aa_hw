class ChangeBands < ActiveRecord::Migration[7.0]
  def change

    add_column :users, :band_id, :bigint, index: true
    add_foreign_key :users, :bands, column: :band_id

  end
end
