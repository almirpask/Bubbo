class Api::V1::QuestionsController < BackofficeController
    def index
        
    end

    def create
        @question = Question.create(question_params)

        respond_to do |format|
            format.json { render json: @question}
        end
    end


    private 

    def question_params
        params.require( :question ).permit(:number, :description, :questionnaire_id)
    end
end
