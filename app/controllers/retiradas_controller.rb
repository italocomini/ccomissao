class RetiradasController < ApplicationController

    before_filter :check_retirada_role
    before_filter :login_required


    # GET /retiradas
    # GET /retiradas.xml
    def index
        @retiradas = Retirada.find(:all)

        respond_to do |format|
            format.html # index.html.erb
            format.xml  { render :xml => @retiradas }
        end
    end

    # GET /retiradas/1
    # GET /retiradas/1.xml
    def show
        @retirada = Retirada.find(params[:id])

        respond_to do |format|
            format.html # show.html.erb
            format.xml  { render :xml => @retirada }
        end
    end

    # GET /retiradas/new
    # GET /retiradas/new.xml
    def new
        @retirada = Retirada.new

        respond_to do |format|
            format.html # new.html.erb
            format.xml  { render :xml => @retirada }
        end
    end

    # GET /retiradas/1/edit
    def edit
        @retirada = Retirada.find(params[:id])
    end

    # POST /retiradas
    # POST /retiradas.xml
    def create
        @retirada = Retirada.new(params[:retirada])

        respond_to do |format|
            if @retirada.save
                flash[:notice] = 'Retirada incluida com sucesso.'
                format.html { redirect_to(@retirada) }
                format.xml  { render :xml => @retirada, :status => :created, :location => @retirada }
            else
                format.html { render :action => "new" }
                format.xml  { render :xml => @retirada.errors, :status => :unprocessable_entity }
            end
        end
    end

    # PUT /retiradas/1
    # PUT /retiradas/1.xml
    def update
        @retirada = Retirada.find(params[:id])

        respond_to do |format|
            if @retirada.update_attributes(params[:retirada])
                flash[:notice] = 'Retirada atualizada com sucesso.'
                format.html { redirect_to(@retirada) }
                format.xml  { head :ok }
            else
                format.html { render :action => "edit" }
                format.xml  { render :xml => @retirada.errors, :status => :unprocessable_entity }
            end
        end
    end

    # DELETE /retiradas/1
    # DELETE /retiradas/1.xml
    def destroy
        @retirada = Retirada.find(params[:id])
        @retirada.destroy

        respond_to do |format|
            format.html { redirect_to(retiradas_url) }
            format.xml  { head :ok }
        end
    end
end
