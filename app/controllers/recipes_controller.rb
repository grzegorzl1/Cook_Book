class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search, :vote]
  # skip_before_action :verify_authenticity_token, only: [:vote]

  def index
    @order = params[:order] || "name"
    @order_dir = params[:order_dir] || "asc"

    @recipes = Recipe.all.order(@order => @order_dir).paginate(page: params[:page], per_page: 10)
  end

  def new
    @recipe = Recipe.new
  end

  def create
   @recipe = Recipe.create(recipe_params)

   if @recipe.new_record?
    render "new"
   else
    redirect_to recipes_path
   end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @next_recipe = @recipe.next_recipe
    @previous_recipe = @recipe.previous_recipe
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update(recipe_params)
      redirect_to recipe_path
    else
      render "edit"
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect_to recipes_path
  end

  def search
    @recipes = Recipe.search(params[:q])
    render :index
  end

  def vote
    recipe = Recipe.find(params[:id])
    if session[:voted_recipes_id].nil? || !session[:voted_recipes_id].include?(recipe.id)
      if params[:dir] == "up"
        recipe.increment!(:rank)
      elsif params[:dir] == "down"
        recipe.decrement!(:rank)
      end

      session[:voted_recipes_id] ||= []
      session[:voted_recipes_id] << recipe.id
      flash[:notice] = "Twój głos został zapisany!"
    else
      flash[:error] = "Już głosowałeś na ten przepis!"
    end

    redirect_to recipe_path(recipe)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :difficulty_level, :category_id)
  end
end
