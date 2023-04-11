class AddBackgroundImageToPages < ActiveRecord::Migration[7.0]
  def change
    add_column :pages, :background_image, :json
  end
end
