class RenameLutitudeColumnToPosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :lutitude, :latitude
  end
end
