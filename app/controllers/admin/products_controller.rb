class Admin::ProductsController < ApplicationController

  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    if params[:category_id].present?
      @category = Category.find(params[:category_id])
      @products = @category.products.includes(:variants).order(:title).page(params[:page]).per(12)
    else
      @products = Product.all.includes(:variants).order(:title).page(params[:page]).per(12)
    end
  end
  
  

  def show
    @product = Product.includes(:variants).find(params[:id])
  end

  def new
    @product = Product.new
    @product.variants.build
  end

  def create
    @product = Product.new(product_params)
  
    if @product.save
      flash[:notice] = 'Product was successfully created.'
      redirect_to admin_product_path(@product)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product.product_categories.destroy_all # this line to remove associated product_categories
    @product.destroy
    respond_to do |format|
      format.html { redirect_to admin_products_path, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :image, :description, :price, variants_attributes: [:id, :title, :price, :_destroy], category_ids: [])
  end
  
      
      
end
