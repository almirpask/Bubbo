class UserDeviseController < Devise::RegistrationsController
    private
    
      def sign_up_params
        params.require(:user).permit(:name, :ra, :email, :password, :password_confirmation)
      end
    
      def account_update_params
        params.require(:user).permit(:name, :ra, :email, :password, :password_confirmation, :current_password)
      end

      def create
        redirect_to action: "destroy", id: current_user.id
      end
end