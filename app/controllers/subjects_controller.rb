class SubjectsController < ApplicationController

  layout "admin"

  before_action :confirm_logged_in

  def index
    @subjects = Subject.all
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
    @subject_count = Subject.count + 1
  end

  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      flash[:notice] = "Subject created successfully"
      redirect_to(:action => "index")
    else
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(subject_params)
      flash[:notice] = "Subject updated successfully"
      redirect_to(:action => "show", :id => @subject.id)
    else
      @subject_count = Subject.count
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
    #@subject.destroy
    #redirect_to(:action => "index")
  end

  def destroy
    subject = Subject.find(params[:id]).destroy
    if subject.name.blank?
      flash[:notice] = "Subject <<unnamed>> destroyed successfully"
    else
    flash[:notice] = "Subject #{subject.name} destroyed successfully"
    end
    redirect_to(:action => "index")
  end

  private

    def subject_params
      params.require(:subject).permit(:name, :position, :visible)
    end
end
