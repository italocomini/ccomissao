#Modulo Reponsável pelo Controle de Acesso do Sistema
module LoginSystem
    protected

    def is_logged_in?
        @logged_in_user = User.find(session[:user]) if session[:user]
    end

    def logged_in_user
        return @logged_in_user if is_logged_in?
    end

    def logged_in_user=(user)
        if !user.nil?
            session[:user] = user.id
            @logged_in_user = user
        end
    end

    def self.included(base)
        base.send :helper_method, :is_logged_in?, :logged_in_user
    end

    def check_role(role)
        unless is_logged_in? && @logged_in_user.has_role?(role)
            flash[:error] = "Você não tem permissão."
            redirect_to :controller => 'account', :action => 'login'
        end
    end

    def check_administrator_role
        check_role('Administrator')
    end

    def check_seguradora_role
        check_role('Seguradora')
    end

    def check_cliente_role
        check_role('Cliente')
    end

    def check_venda_role
        check_role('Venda')
    end

    def check_comissao_role
        check_role('Comissão')
    end

    def check_retirada_role
        check_role('Retirada')
    end

    def login_required
        unless is_logged_in?
            flash[:error] = "Acesso negado, favor efetuar login."
            redirect_to :controller => 'account', :action => 'login'
        end
    end
end
