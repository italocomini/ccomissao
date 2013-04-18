class ComissaosController < ApplicationController
    
    before_filter :check_comissao_role
    before_filter :login_required

    # GET /comissaos
    # GET /comissaos.xml
    def index
        @comissaos = Comissao.search(params[:search])
        respond_to do |format|
            format.html # index.html.erb
            format.xml  { render :xml => @comissaos }
        end
    end

    # GET /comissaos/1
    # GET /comissaos/1.xml
    def show
        @comissao = Comissao.find(params[:id])
        respond_to do |format|
            format.html # show.html.erb
            format.xml  { render :xml => @comissao }
        end
    end

    # GET /comissaos/new
    # GET /comissaos/new.xml
    def new
        @comissao = Comissao.new

        respond_to do |format|
            format.html # new.html.erb
            format.xml  { render :xml => @comissao }
        end
    end

    # GET /comissaos/1/edit
    def edit
        @comissao = Comissao.find(params[:id])
    end

    # POST /comissaos
    # POST /comissaos.xml
    def create
        @comissao = Comissao.new(params[:comissao])

        respond_to do |format|
            if @comissao.save
                flash[:notice] = 'Comissão cadastrado com sucesso.'
                format.html { redirect_to(@comissao) }
                format.xml  { render :xml => @comissao, :status => :created, :location => @comissao }
            else
                format.html { render :action => "new" }
                format.xml  { render :xml => @comissao.errors, :status => :unprocessable_entity }
            end
        end
    end

    # PUT /comissaos/1
    # PUT /comissaos/1.xml
    def update
        @comissao = Comissao.find(params[:id])

        respond_to do |format|
            if @comissao.update_attributes(params[:comissao])
                flash[:notice] = 'Comissão atualizado com sucesso.'
                format.html { redirect_to(@comissao) }
                format.xml  { head :ok }
            else
                format.html { render :action => "edit" }
                format.xml  { render :xml => @comissao.errors, :status => :unprocessable_entity }
            end
        end
    end

    # DELETE /comissaos/1
    # DELETE /comissaos/1.xml
    def destroy
        @comissao = Comissao.find(params[:id])
        @comissao.destroy

        respond_to do |format|
            format.html { redirect_to(comissaos_url) }
            format.xml  { head :ok }
        end
    end

    #GET /show_venda/1
    def show_venda
        @venda = Venda.find(params[:id])
        render :partial => 'form_venda'
    end

end
