class ImagesController < ApplicationController
  before_filter :authenticate_client!

  respond_to :html, :json

  def new 
    @image = Image.new
    respond_with(@image)
  end

  def index
    @images = Image.all
    respond_with(@images)
  end

  def create
    @image = Image.new(params[:image])

    if session[:image_property_id]
      p = Property.find(session[:image_property_id])
      @image.property = p
    end


    respond_to do |format|
      if @image.save
        if params[:image][:file].blank? 
          format.html { redirect_to(@image, 
                      :notice => 'Image was sucessfuly uploaded.') }
          format.json { render :json => @image,
                      :status => :created, 
                      :location => @image }
        else
	  format.html { render :crop }
	end
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @image.errors,
                       :status => :unprocessable_entity }
      end
    end
  end

  def update
    @image = Image.find(params[:id])

    respond_to do |format|
      if @image.update_attributes(params[:image])
        if params[:image][:file]
	  format.html { render :crop }
        elsif session[:image_property_id]
          format.html { redirect_to(property_url(session[:image_property_id]),
                        :notice => 'Attached Image') }
        else
          format.html { redirect_to(images_url, 
                      :notice => 'Attached Image') }
          format.json { head :no_content }
        end
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @image.errors,
                       :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    respond_to do |format|
          format.html { redirect_to(images_url, 
                       :notice => 'Image removed') }
          format.json { head :no_content }
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def show
    @image = Image.find(params[:id])
    respond_with(@image)
  end


end
