class Backoffice::SubjectsController < BackofficeController
 
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

  private

  
  def params_subject
    params.require(:subject).permit(:description)
  end
  
end
