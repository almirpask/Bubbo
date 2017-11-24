class Api::V1::HomeController < Api::V1::ApiController
  def index
  
    answers = Answer.where(user_id: params[:id])
    responses = Array.new
    questionnaires = Questionnaire.count
    answers.each do |a|
      alternatives = Alternative.where(id: a.alternative_id)
      alternatives.each do |alt|
        responses << {alternative_id: a.alternative_id, answer: alt.answer} 
      end
    end
    
  
    rw = responses.partition { |a| a[:answer] }
    render json: {rights: rw[0].count, wrongs: rw[1].count, answers: answers.count, questionnaires: questionnaires}
  end
end
