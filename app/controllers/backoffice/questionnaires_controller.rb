class Backoffice::QuestionnairesController < BackofficeController
    before_action :load_classrooms, only: [:new, :edit]
    before_action :set_questionnaire, only: [:edit, :update]

    def index
        arq = File.new("./erro.txt", "w+")
        arq.puts "hello world"
        arq.close
        @questionnaires = Questionnaire.all
    end

    def new
        @questionnaire = Questionnaire.new
        @mode = false
    end

    def create
        @questionnaire = Questionnaire.new(params_questionnaire)
        if @questionnaire.save!
            redirect_to edit_backoffice_questionnaire_path(@questionnaire.id)
        else
            render :new
        end
    end

    def edit
        @mode = true
    end

    def update
        if @questionnaire.update(params_questionnaire)
            redirect_to edit_backoffice_questionnaire_path(@questionnaire.id)
        else
            render :edit
        end
        
    end

    private 

    def set_questionnaire
        @questionnaire = Questionnaire.find(params[:id])
    end
    def params_questionnaire
        params.require(:questionnaire).permit(:teacher_id, :active, :classroom_id, :theme)
    end

    def load_classrooms
        #"#{subject_id} - #{subject.description}"
        @classrooms = Classroom.all.collect { |c| ["#{c.subject_id} - #{c.subject.description}", c.id] }
    end
end
