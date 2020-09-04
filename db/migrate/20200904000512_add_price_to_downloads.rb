class AddPriceToDownloads < ActiveRecord::Migration[6.0]
  def change
    add_column :downloads, :price, :decimal, precision: 4, scale: 2
  end
end
