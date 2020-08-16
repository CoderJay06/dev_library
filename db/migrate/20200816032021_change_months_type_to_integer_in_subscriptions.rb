class ChangeMonthsTypeToIntegerInSubscriptions < ActiveRecord::Migration[6.0]
  def change
    change_column :subscriptions, :months, :integer
  end
end
