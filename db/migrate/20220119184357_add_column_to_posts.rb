class AddColumnToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :title, :string
    add_column :posts, :text, :text
    add_column :posts, :commentsCounter, :integer, default: 0
    add_column :posts, :likesCounter, :integer, default: 0
  end
end
