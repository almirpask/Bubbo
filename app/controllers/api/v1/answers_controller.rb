class Api::V1::AnswersController < Api::V1::ApiController
    protect_from_forgery

    def index
        @answers = Answer.all

        render json: @answers
    end

    def create
        begin
            @answers = params_answer
            # @answers = JSON.parse(@answers)
            # render json: @answers
            # @params = JSON.parse(@answers[:user_id])
            @questions = JSON.parse(@answers[:questions])
            # render json: @questions
                unless @answers.empty?  
                    # @a
                    @questions.each do |answer|
                        # @a = answer["question_id"]
                        # render json: @a
                        
                        Answer.create(user_id: JSON.parse(@answers[:user_id]), questionnaire_id: JSON.parse(@answers[:questionnaire_id]), alternative_id: answer["alternative_id"])
                    end
                    answers = Answer.where(:user_id => @answers[:user_id]).where(:questionnaire_id => @answers[:questionnaire_id])
                    @responses = Array.new;
                    answers.each do |a| 
                        alternatives = Alternative.where(:id => a.alternative_id)
                        alternatives.each do |alt|
                            @responses << {alternative_id: a.alternative_id, answer: alt.answer}
                            # unless alt.answer
                            #   @responses << {alternative_id: a.alternative_id, answer: alt.answer}
                            # else
                            #     @responses << {alternative_id: a.alternative_id, answer: alt.answer}
                            # end
                        end
                        # if r[:answer]
                        # #     # @response << {alternative_id: a.alternative_id, answer: true}
                        # # else
                        # #     # @response << {alternative_id: a.alternative_id, answer: false}
                        # end
                    end
                    # @apps.select {|a| a.environment == 0}.count
                    #a = @responses.select {|r| r[:answer] == false}.count
                    a = @responses.partition { |r| r[:answer] }

                    # @rights = Answer.
                    render json: {answers: @responses, rights: a[0].count, wrongs: a[1].count}
                    
                else
                    render json: {answers: {}, rights: 0, wrongs: 0}
                end
        rescue => exception
            a = File.new("answer", "w")
            a.write(exception.message)
            
        end

        # @answers = params_answer

        # render json: @answers
       
    end

    private

    def params_answer
        params.permit(:user_id, :questions, :questionnaire_id)
    end

    
end
