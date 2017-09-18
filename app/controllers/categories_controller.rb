class CategoriesController < ApplicationController
  # before_action :authenticate_admin, except: [:index, :show, :search]

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)

    if @category.new_record?
      render "new"
    else
      redirect_to categories_path(@categories)
    end
  end

  def show
    @category = Category.find(params[:id])
    @recipe = Recipe.new
  end

  def index
    @categories = Category.all.order(id: :desc)
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update

    @category = Category.find(params[:id])

    if @category.update(category_params)
      redirect_to @category
    else
      render "edit"
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to categories_path
  end

  def search
    @categories = Categories.search(params[:q])
    render :index
  end

  private

  def category_params
    params.require(:category).permit(:name, :text)
  end
end
