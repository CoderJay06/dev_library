class ChangeAuthorToBeIntegerInBooks < ActiveRecord::Migration[6.0]
  def up
    change_column :books, :author, :integer
  end

  def down
    change_column :books, :author, :string 
  end 
end
