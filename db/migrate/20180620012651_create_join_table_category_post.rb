class CreateJoinTableCategoryPost < ActiveRecord::Migration[5.2]
  def change
    create_join_table :categories, :articles do |t|
      t.index [:category_id, :article_id]
      # t.index [:product_id, :category_id]
    end
  end
end
