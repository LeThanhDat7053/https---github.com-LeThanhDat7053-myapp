class ProductsController < ApplicationController
  # Sử dụng before_action để set @product cho các action show, edit, update, destroy
  before_action :set_product, only: %i[show edit update destroy]

  # Action cho GET /products
  def index
    @products = Product.all
  end

  # Action cho GET /products/new
  def new
    @product = Product.new
  end

  # Action cho POST /products
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product # Chuyển hướng đến trang show của sản phẩm mới
    else
      render :new # Nếu không lưu được, render lại form tạo sản phẩm
    end
  end

  # Action cho GET /products/:id
  def show
  end

  # Action cho GET /products/:id/edit
  def edit
  end

  # Action cho PATCH/PUT /products/:id
  def update
    if @product.update(product_params)
      redirect_to @product # Chuyển hướng đến trang show của sản phẩm sau khi cập nhật
    else
      render :edit # Nếu không cập nhật được, render lại form chỉnh sửa sản phẩm
    end
  end

  # Action cho DELETE /products/:id
  def destroy
    @product.destroy
    redirect_to products_path # Quay lại trang danh sách sản phẩm sau khi xóa
  end

  private

  # Strong parameters cho tạo mới và cập nhật product
  def product_params
    params.require(:product).permit(:name, :price)
  end

  # Set product dùng cho show, edit, update, destroy
  def set_product
    @product = Product.find(params[:id])
  end
end
