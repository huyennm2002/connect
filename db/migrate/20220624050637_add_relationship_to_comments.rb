class AddRelationshipToComments < ActiveRecord::Migration[7.0]
  def change
    remove_column :comments, :user_id
    add_reference :comments, :commentable, polymorphic: true, null: false
    add_reference :comments, :user, null: false, foreign_key: true
  end
end
