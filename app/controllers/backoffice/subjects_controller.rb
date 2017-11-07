class Backoffice::SubjectsController < BackofficeController
  before_action :set_subject, only: [:edit, :update]
  def index
    @subjects = Subject.all
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(params_subject)
    if @subject.save
      redirect_to backoffice_subjects_path
    else
      render :new
    end
  end

  def edit
  end
  def update
    if @subject.update(params_subject)
      redirect_to backoffice_subjects_path
    else
      render :edit
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
