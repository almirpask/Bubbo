class Api::V1::AnswersController < Api::V1::ApiController
    protect_from_forgery

    def index
        @answers = Answer.all

        render json: @answers
    end

    def create
        begin
            @answers = params_answer
            @questions = params[:questions]
            unless @answers.empty?
                if Answer.where(user_id: @answers[:user_id]).where(questionnaire_id: @answers[:questionnaire_id]).empty?
                    @questions.each do |answer|
                        Answer.create(user_id: @answers[:user_id], questionnaire_id: @answers[:questionnaire_id], alternative_id: answer[:alternative_id])
                    end
                    answers = Answer.where(:user_id => @answers[:user_id]).where(:questionnaire_id => @answers[:questionnaire_id])
                    @responses = Array.new;
                    answers.each do |a| 
                        alternatives = Alternative.where(:id => a.alternative_id)
                        alternatives.each do |alt|
                            @responses << {alternative_id: a.alternative_id, answer: alt.answer} 
                        end
                        
                    end
                    rw = @responses.partition { |r| r[:answer] }
                    render json: {answers: @responses, rights: rw[0].count, wrongs: rw[1].count, answered: false}
                else
                    render json: {answers: {}, rights: 0, wrongs: 0, answered: true} 
                end
                
            else
                render json: {answers: {}, rights: 0, wrongs: 0, answered: false}
            end
        rescue => exception
            render json: {error: exception.message }
        end
    end

    private

    def params_answer
        params.permit(:user_id, :questionnaire_id, :questions)
    end
end