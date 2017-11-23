class Backoffice::AlternativesController <  BackofficeController
	skip_before_action :verify_authenticity_token, if: :json_request?
	before_action :set_alternative, only: [:edit, :update]
	def create
		@alternative = Alternative.create(alternative_params)

		respond_to do |format|
			format.json { render json: @alternative}
		end
	end

	def edit
		respond_to do |format|
			format.json { render json: @alternative }
		end
    end

	def update
		begin
			if @alternative.update(alternative_params)
				render json: @alternative
			else
				render json: @alternative.erros, status: :unprocessable_entity
			end
			
		rescue => exception 
			render json: exception.message
		end
		
    end

	def question
        @id = params.permit(:id)
        @alternatives = Alternative.where(:question_id => @id[:id])
        
        respond_to do |format|
            format.json { render json: @alternatives}
        end
    end
	
	
	def json_request? 
		request.format.json?
	end

	private

	def set_alternative
		@alternative = Alternative.find(params[:id])
	end
	

	def alternative_params
		params.require(:alternative).permit(:answer, :question_id, :description)
	end

end
