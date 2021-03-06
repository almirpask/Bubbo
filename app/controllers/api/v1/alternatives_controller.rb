class Api::V1::AlternativesController <  Api::V1::ApiController
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
		
		if @alternative.update(alternative_params)
            render json: @alternative
        else
            render json: @alternative.errros, status: :unprocessable_entity
        end
    end

	def question
        @id = params.permit(:id)
        @alternatives = Alternative.where(:question_id => @id[:id])
		
		render json: @alternatives
    end

	private

	def set_alternative
		@alternative = Alternative.find(params[:id])
	end


	def alternative_params
		params.require(:alternative).permit(:answer, :question_id, :description)
	end

end
