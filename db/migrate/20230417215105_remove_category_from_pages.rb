class RemoveCategoryFromPages < ActiveRecord::Migration[7.0]
  def change
    remove_reference :pages, :category, index: true, foreign_key: true
  end
end
