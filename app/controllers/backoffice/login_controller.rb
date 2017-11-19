class Backoffice::LoginController < ApplicationController
    skip_before_action :verify_authenticity_token, if: :json_request?
    def auth
        @params = auth_params
        # @return
        @user = User.where(:email => @params[:email]).where(:ra => @params[:ra])
        
        unless @user.empty?
            @return = {token: @user[0].authentication_token, name: @user[0].name}
            render json: @return
        else    
            @return = {token: "", name: ""}
            render json: @return, status: 404
        end
        # render json: @auth 
    end


    protected
    def json_request? 
		request.format.json?
	end

    private

    def auth_params
        params.permit(:email, :ra)
    end
end
