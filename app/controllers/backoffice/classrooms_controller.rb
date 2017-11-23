class Backoffice::ClassroomsController < BackofficeController
    before_action :set_classroom, only: [:edit, :update]
    
     def index
       @classrooms = Classroom.all
       
     end
   
    def new
        @subjects = Subject.all
        @teachers = Teacher.all
        @classroom = Classroom.new
    end
   
     def create
       @classroom = Classroom.new(params_classroom)
       if @classroom.save
         redirect_to backoffice_classrooms_path
       else
         render :new
       end
     end

     def edit
     end
     def update
       if @classroom.update(params_classroom)
         redirect_to backoffice_classrooms_path
       else
         render :edit
       end
       
     end
   
     private
   
     def set_classroom
       @classroom = Classroom.find(params[:id])
     end
  
     def params_classroom
       params.require(:classroom).permit(:teacher_id, :subject_id)
     end
     
   end
   