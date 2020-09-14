class RenameAuthorToBeAuthorIdInBooks < ActiveRecord::Migration[6.0]
  def up
    rename_column :books, :author, :author_id
  end

  def down
    rename_column :books, :author_id, :author 
  end 
end
