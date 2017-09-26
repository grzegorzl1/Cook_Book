class ComponentsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]

  def new
    @component = Component.new
  end

  def create
    @component = Component.create(component_params)

    if @component.new_record?
      render "new"
    else
      redirect_to components_path(@components)
    end
  end

  def show
    @component = Component.find(params[:id])
  end

  def index
    @components = Component.all.order(name: :asc)
  end

  def edit
    @component = Component.find(params[:id])
  end

  def update

    @component = Component.find(params[:id])

    if @component.update(component_params)
      redirect_to @component
    else
      render "edit"
    end
  end

  def destroy
    @component = Component.find(params[:id])
    @component.destroy

    redirect_to components_path
  end

  def search
    @components = Components.search(params[:q])
    render :index
  end

  private

  def component_params
    params.require(:component).permit(:name, :text)
  end
end
