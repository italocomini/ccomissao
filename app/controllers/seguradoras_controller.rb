class SeguradorasController < ApplicationController

    before_filter :check_seguradora_role
    before_filter :login_required

    # GET /seguradoras
    # GET /seguradoras.xml
    def index
        @seguradoras = Seguradora.find(:all)

        respond_to do |format|
            format.html # index.html.erb
            format.xml  { render :xml => @seguradoras }
        end
    end

    # GET /seguradoras/1
    # GET /seguradoras/1.xml
    def show
        @seguradora = Seguradora.find(params[:id])

        respond_to do |format|
            format.html # show.html.erb
            format.xml  { render :xml => @seguradora }
        end
    end

    # GET /seguradoras/new
    # GET /seguradoras/new.xml
    def new
        @seguradora = Seguradora.new

        respond_to do |format|
            format.html # new.html.erb
            format.xml  { render :xml => @seguradora }
        end
    end

    # GET /seguradoras/1/edit
    def edit
        @seguradora = Seguradora.find(params[:id])
    end

    # POST /seguradoras
    # POST /seguradoras.xml
    def create
        @seguradora = Seguradora.new(params[:seguradora])

        respond_to do |format|
            if @seguradora.save
                flash[:notice] = 'Seguradora cadastrada com sucesso.'
                format.html { redirect_to(@seguradora) }
                format.xml  { render :xml => @seguradora, :status => :created, :location => @seguradora }
            else
                format.html { render :action => "new" }
                format.xml  { render :xml => @seguradora.errors, :status => :unprocessable_entity }
            end
        end
    end

    # PUT /seguradoras/1
    # PUT /seguradoras/1.xml
    def update
        @seguradora = Seguradora.find(params[:id])

        respond_to do |format|
            if @seguradora.update_attributes(params[:seguradora])
                flash[:notice] = 'Seguradora atualizada com sucesso.'
                format.html { redirect_to(@seguradora) }
                format.xml  { head :ok }
            else
                format.html { render :action => "edit" }
                format.xml  { render :xml => @seguradora.errors, :status => :unprocessable_entity }
            end
        end
    end

    # DELETE /seguradoras/1
    # DELETE /seguradoras/1.xml
    def destroy
        @seguradora = Seguradora.find(params[:id])
        @seguradora.destroy

        respond_to do |format|
            format.html { redirect_to(seguradoras_url) }
            format.xml  { head :ok }
        end
    end
end
