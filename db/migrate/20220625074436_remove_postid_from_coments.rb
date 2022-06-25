class RemovePostidFromComents < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :post_id, :integer
  end
end
