class RenameCountToQuantityInDownloads < ActiveRecord::Migration[6.0]
  def change
    rename_column :downloads, :count, :quantity
  end
end
