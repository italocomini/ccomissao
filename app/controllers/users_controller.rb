class UsersController < ApplicationController

    before_filter :check_administrator_role, :only => [:index, :destroy, :enable_toggle]
    before_filter :login_required, :only => [:edit, :update]

    def index
        @users = User.find(:all)
    end

    def show
        @user = User.find(params[:id])
    end

    def show_by_username
        @user = User.find_by_username(params[:username])
        render :action => 'show'
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(params[:user])
        if @user.save
            #Se for cadastro externo habilitar o código abaixo
            #self.logged_in_user = @user
            flash[:notice] = "Conta criada com sucesso."
            redirect_to home_index_url
        else
            render :action => 'new'
        end
    end

    def edit
        @user = logged_in_user
    end

    def update
        @user = User.find(params[:id])
        if @user.update_attributes(params[:user])
            flash[:notice] = "Informações atualizada com sucesso."
            redirect_to home_index_url
            #Se for redirecionar para o controle de permissão habilitar o código abaixo
            #redirect_to :action => 'index'
        else
            render :action => 'edit'
        end
    end

    def destroy
        @user = User.find(params[:id])
        if @user.update_attribute(:enabled, false)
            flash[:notice] = "Usuário desabilitado."
        else
            flash[:error] = "Houve um problema ao habilitar o usuário."
        end
        redirect_to :action => 'index'
    end

    def enable
        @user = User.find(params[:id])
        if @user.update_attribute(:enabled, true)
            flash[:notice] = "Usuário habilitado"
        else
            flash[:error] = "Houve um problema ao desabilitar o usuário."
        end
        redirect_to :action => 'index'
    end
end
