class PropertiesController < ApplicationController

  before_filter :authenticate_client!

  respond_to :html, :json

  def show
    @property = Property.find(params[:id])
    @clients = Client.all_but_id(current_client.id)
    session[:image_property_id] = params[:id]
    respond_with(@property)
  end

  def index
    @properties = Property.all
    respond_with(@properties)
  end

  def listmine
  end

  # links a client to the property
  def link
    property = Property.find(params[:id])
    client = Client.find(params[:client_id])
    property.client = client

    respond_to do |format|
      if property.save
        format.html { redirect_to(property, 
                      :notice => "Property now being shown to #{client.name}.") }
        format.json { head :no_content }
      else
        format.html  { render :action => "show" }
        format.json  { render :json => property.errors,
                       :status => :unprocessable_entity }
      end
    end

  end

  def unlink
    property = Property.find(params[:id])
    property.client = nil

    respond_to do |format|
      if property.save
        format.html { redirect_to(property, 
                      :notice => "Property now taken off the market.") }
        format.json { head :no_content }
      else
        format.html  { render :action => "show" }
        format.json  { render :json => property.errors,
                       :status => :unprocessable_entity }
      end
    end

  end


  def new 
    @property = Property.new
    respond_with(@property)
  end

  def create
    @property = Property.new(params[:property])

    respond_to do |format|
      if @property.save
        format.html { redirect_to(@property, 
                      :notice => 'Post was sucessfuly created.') }
        format.json { render :json => @property,
                      :status => :created, 
                      :location => @property }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @property.errors,
                       :status => :unprocessable_entity }
      end
    end
  end

  def update
    @property = Property.find(params[:id])

    respond_to do |format|
      if @property.update_attributes(params[:property])
        format.html { redirect_to(@property, 
                      :notice => 'Post was sucessfuly updated.') }
        format.json { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @property.errors,
                       :status => :unprocessable_entity }
      end
    end
  end


  def edit
    @property = Property.find(params[:id])
  end

end
