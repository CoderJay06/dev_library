class RemovePriceFromDownloads < ActiveRecord::Migration[6.0]
  def change
    remove_column :downloads, :price, :decimal
  end
end
