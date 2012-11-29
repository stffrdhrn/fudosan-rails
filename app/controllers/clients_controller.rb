class ClientsController < ApplicationController

  respond_to :html, :json

  def show
    @client = Client.find(params[:id])
   respond_with(@client)
  end

  def index
    @clients = Client.all
    respond_with(@clients)
  end

  def new 
    @client = Client.new
    respond_with(@client)
  end

  def create
    @client = Client.new(params[:client])

    respond_to do |format|
      if @client.save
        format.html { redirect_to(@client, 
                      :notice => 'Client was sucessfuly created.') }
        format.json { render :json => @client,
                      :status => :created, 
                      :location => @client }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @client.errors,
                       :status => :unprocessable_entity }
      end
    end
  end

  def update
    @client = Client.find(params[:id])

    respond_to do |format|
      if @client.update_attributes(params[:client])
        format.html { redirect_to(@client, 
                      :notice => 'Client was sucessfuly updated.') }
        format.json { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @client.errors,
                       :status => :unprocessable_entity }
      end
    end
  end


  def edit
    @client = Client.find(params[:id])
  end

end
