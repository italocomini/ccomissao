class VendasController < ApplicationController
    
    before_filter :check_venda_role
    before_filter :login_required

    # GET /vendas
    # GET /vendas.xml
    def index
        #@vendas = Venda.find(:all)
        @vendas = logged_in_user.vendas
        respond_to do |format|
            format.html # index.html.erb
            format.xml  { render :xml => @vendas }
        end
    end

    # GET /vendas/1
    # GET /vendas/1.xml
    def show
        @venda = Venda.find(params[:id])

        respond_to do |format|
            format.html # show.html.erb
            format.xml  { render :xml => @venda }
            format.json  { render :json => @venda }
        end
    end

    # GET /vendas/new
    # GET /vendas/new.xml
    def new
        @venda = Venda.new

        respond_to do |format|
            format.html # new.html.erb
            format.xml  { render :xml => @venda }
        end
    end

    # GET /vendas/1/edit
    def edit
        @venda = Venda.find(params[:id])
    end

    # POST /vendas
    # POST /vendas.xml
    def create
        @venda = Venda.new(params[:venda])
        @venda.user = logged_in_user
        respond_to do |format|
            if @venda.save
                flash[:notice] = 'Venda adicionada com sucesso.'
                format.html { redirect_to(@venda) }
                format.xml  { render :xml => @venda, :status => :created, :location => @venda }
            else
                format.html { render :action => "new" }
                format.xml  { render :xml => @venda.errors, :status => :unprocessable_entity }
            end
        end
    end

    # PUT /vendas/1
    # PUT /vendas/1.xml
    def update
        @venda = Venda.find(params[:id])

        respond_to do |format|
            if @venda.update_attributes(params[:venda])
                flash[:notice] = 'Venda alterada com sucesso.'
                format.html { redirect_to(@venda) }
                format.xml  { head :ok }
            else
                format.html { render :action => "edit" }
                format.xml  { render :xml => @venda.errors, :status => :unprocessable_entity }
            end
        end
    end

    # DELETE /vendas/1
    # DELETE /vendas/1.xml
    def destroy
        @venda = Venda.find(params[:id])
        @venda.destroy

        respond_to do |format|
            format.html { redirect_to(vendas_url) }
            format.xml  { head :ok }
        end
    end
end
