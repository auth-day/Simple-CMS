class PagesController< ApplicationController
  layout "admin"

  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def edit
    @page = Page.find(params[:id])
  end

  def new
    @subjects = Subject.all
    @page = Page.new
  end

  def create
    @page = Page.new(require_params)
    if @page.save
      flash[:notice] = "Page created successfully"
      redirect_to(:action => 'index')
    else
      render('new')
    end
    #redirect_to(:action => 'index')
  end



  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(require_params)
      flash[:notice] = "Page updated successfully"
      redirect_to(:action => "index")
    else
      render(:action => "edit")
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id]).destroy
    flash[:notice] = "Page destroyed successfully"
    redirect_to(:action => "index")
  end

  def require_params
    params.require(:page).permit(:subject_id, :name, :permalink, :position, :visible)
  end

end
