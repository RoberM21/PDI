class SessionsController < ApplicationController
  def create
     user = User.find_by_email(params[:email])
     # If the user exists AND the password entered is correct.
     if user && user.authenticate(params[:password])
			 if user.email_confirmed
				 cookies.signed[:user_id] = user.id
				 session[:user_id] = user.id
         if current_user.rol=="root"
				  redirect_to :root
        else
          redirect_to '/perfil'
        end
			 else
				 flash[:error] = 'Activa tu cuenta mediante el email que se te acaba de enviar'
				 redirect_to '/login'
			 end
     else
			 flash[:error] = 'Combinacion de correo/contraseña inválida' # Not quite right!
			 redirect_to '/login'
     end
   end

   def destroy
		 @current_user = nil
     session[:user_id] = nil
		 cookies.signed[:user_id] = nil
     redirect_to '/login'
   end

	private
	def user_params
		params.permit(:email,:password)
	end
end
