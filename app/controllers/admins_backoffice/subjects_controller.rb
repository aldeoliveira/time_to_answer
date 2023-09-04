class AdminsBackoffice::SubjectsController < ApplicationController
  before_action :set_subject, only: [:edit, :update, :destroy]


  def index
    @subjects = Subject.all
  end

  def new
    @subject = Subject.new
  end
  
  def create
    @subject = Subject.new(params_subject)
    if @subject.save
      flash[:success] = "Subject successfully created"
      redirect_to @subject
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def edit
  end

  def update
      if @subject.update_attributes(params[:subject])
        flash[:success] = "O assunto foi cadastrado com sucesso"
        redirect_to @subject
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end

  def destroy
    if @subject.destroy
      redirect_to admins_backoffice_subjects_path, notice: "Assunto excluído com sucesso"
    else
      redirect_to :index
    end
  end


  private

  def set_subject
    @subject = Subject.find(params[:id])
  end

  def params_subject
    params.require(:subject).permit(:description)
  end
end
