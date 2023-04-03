class AddCategoryToPages < ActiveRecord::Migration[7.0]
  def change
    add_reference :pages, :category, index: true, foreign_key: true
  end
end
