class BackofficeController < ApplicationController
    layout 'backoffice'
    before_action :authenticate_teacher!
    
end
  