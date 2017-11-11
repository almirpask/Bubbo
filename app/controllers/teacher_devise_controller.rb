class TeacherDeviseController < Devise::RegistrationsController
    private
    
      def sign_up_params
        params.require(:teacher).permit(:name, :email, :password, :password_confirmation)
      end
    
      def account_update_params
        params.require(:teacher).permit(:name, :email, :password, :password_confirmation, :current_password)
      end
end