class RemoveMonthsAndSubscriptionTypeFromDownloads < ActiveRecord::Migration[6.0]
  def change
    remove_column :downloads, :months, :integer
    remove_column :downloads, :subscription_type, :string
  end
end
