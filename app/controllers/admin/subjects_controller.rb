class Admin::SubjectsController < ApplicationController
  before_action :load_subject, except: [:index, :new, :create]

  def new
  end

  def new
    @subject = Subject.new
    @subject.tasks.build
  end

  def create
    @subject = Subject.new subject_params
    if @subject.save
      flash[:success] = t "admin.subjects.success"
      redirect_to root_url
    else
      render :new
    end
  end

  private
  def subject_params
    params.require(:subject).permit :name, :description,
      tasks_attributes: [:id, :name]
  end

  def load_subject
    @subject = Subject.find params[:id]
  end
end
