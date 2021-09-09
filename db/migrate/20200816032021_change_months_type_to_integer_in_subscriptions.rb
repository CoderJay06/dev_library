class ChangeMonthsTypeToIntegerInSubscriptions < ActiveRecord::Migration[6.0]
  def change
    change_column :subscriptions, :months, :integer, using: "months::integer"
  end
end
