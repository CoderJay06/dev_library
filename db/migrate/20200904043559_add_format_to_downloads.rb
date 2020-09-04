class AddFormatToDownloads < ActiveRecord::Migration[6.0]
  def change
    add_column :downloads, :format, :string, default: "PDF"
  end
end
