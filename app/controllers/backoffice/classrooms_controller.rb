class Backoffice::ClassroomsController < BackofficeController
    
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
   
     private
   
     
     def params_classroom
       params.require(:classroom).permit(:teacher_id, :subject_id)
     end
     
   end
   