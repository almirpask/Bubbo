class Api::V1::QuestionnairesController < Api::V1::ApiController
    before_action :load_classrooms, only: [:new, :edit]
    before_action :set_questionnaire, only: [:edit, :update]

    def index
        @questionnaires = Questionnaire.all
        
        render json: @questionnaires
        # respond_to do |format|
		# 	format.json { render json: @questionnaires}
		# end
    end

    def new
        @questionnaire = Questionnaire.new
        @mode = false
    end
    def show
        @param = params.permit(:id)
        
        
        @questionnaires = Questionnaire.joins(:classroom).where(classrooms: {subject_id: @param[:id]})

        # if @param[:id] == '1'
        #     questionnaires = [
        #         {id: 1, teacher_name: "Almir", theme:"Conceitos de Engenharia de Software" ,subject: "Engenharia de Software", ative: true},
        #         {id: 3, teacher_name: "Almir", theme:"Design Patterns" ,subject: "Engenharia de Software", ative: true}
        #     ]
        # else
        #     questionnaires = [
        #         {id: 4, teacher_name: "Almir",theme:"Tipos de Variaveis" , subject: "POO", ative: true},
        #         {id: 6, teacher_name: "Almir",theme:"Entendendo Classes e Objetos" ,subject: "POO", ative: true},
        #         {id: 7, teacher_name: "Almir",theme:"Herança e Polimorfismo", subject: "POO", ative: true}
        #     ]
        # end
        render json: @questionnaires
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
        params.require(:questionnaire).permit(:teacher_id, :active, :classroom_id)
    end

    def load_classrooms
        #"#{subject_id} - #{subject.description}"
        @classrooms = Classroom.all.collect { |c| ["#{c.subject_id} - #{c.subject.description}", c.id] }
    end
end
