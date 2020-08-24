class ChangeSubscriptionsToDownloads < ActiveRecord::Migration[6.0]
  def change
    rename_table :subscriptions, :downloads 
  end
end
