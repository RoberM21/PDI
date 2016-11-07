class WelcomeController < ApplicationController
  def index
    if current_user.blank?
      redirect_to "/login"
    else
      if @current_user.rol == "1"
        redirect_to "/perfil"
      end
    end
  end
end
