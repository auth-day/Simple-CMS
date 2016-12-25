class SectionControllerController < ApplicationController
  layout "admin"

  def index
    @sections = Section.all
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(require_params)
    if @section.save
      flash[:notice] = "Section created successfully"
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])
    @section.update_attributes(require_params)
    if @section.save
      flash[:notice] = "Section updated successfully"
      redirect_to(:action => 'index')
    else
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    section = Section.find(params[:id])
    section.destroy
    flash[:notice] = "Section destroyed successfully"
    redirect_to(:action => 'index')
  end

  def require_params
    params.require(:section).permit(:page_id, :name, :position, :visible, :content_type, :content)
  end
end
