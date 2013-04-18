class AccountController < ApplicationController
    def login
    end

    def authenticate
        self.logged_in_user = User.authenticate(params[:user][:username],
            params[:user][:password])
        if is_logged_in?
            redirect_to home_index_url
        else
            flash[:error] = "O usuário ou senha não confere, tente novamente."
            redirect_to :action => 'login'
        end
    end

    def logout
        if request.post?
            reset_session
            flash[:notice] = "Sessão encerrada com sucesso."
        end
        redirect_to home_index_url
    end

end
