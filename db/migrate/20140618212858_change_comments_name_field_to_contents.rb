class ChangeCommentsNameFieldToContents < ActiveRecord::Migration
  def change
    rename_column :comments, :name, :contents
  end
end
