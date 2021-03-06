class Api::V1::QuestionsController <  Api::V1::ApiController
    def index
        
    end

    def create
        @question = Question.create(question_params)

        respond_to do |format|
            format.json { render json: @question}
        end
    end
    
    

    def questionnaire
        @id = params.permit(:id)
        @questions = Question.where(:questionnaire_id => @id[:id])
        
        render json: @questions
    end


    private 

  
    def question_params
        params.require( :question ).permit(:number, :description, :questionnaire_id)
    end
end
