class PropertiesController < ApplicationController

  respond_to :html, :json

  def show
    @property = Property.find(params[:id])
   respond_with(@property)
  end

  def index
    @properties = Property.all
    respond_with(@properties)
  end

  def listmine
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
