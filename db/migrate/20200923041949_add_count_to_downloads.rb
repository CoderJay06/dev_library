class AddCountToDownloads < ActiveRecord::Migration[6.0]
  def change
    add_column :downloads, :count, :integer
  end
end
