class PagesController< ApplicationController
  layout "admin"

  before_action :confirm_logged_in
  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def edit
    @page = Page.find(params[:id])
    @subject_count = Page.count
  end

  def new
    @subjects = Subject.all
    @page = Page.new
    @subject_count = Page.count + 1
  end

  def create
    @page = Page.new(require_params)
    if @page.save
      flash[:notice] = "Page created successfully"
      redirect_to(:action => 'index')
    else
      @subjects = Subject.all
      @subject_count = Page.count
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
      @subject_count = Page.count
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
