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

    respond_to do |format|
      if @image.save
        format.html { redirect_to(@image, 
                      :notice => 'Image was sucessfuly uploaded.') }
        format.json { render :json => @image,
                      :status => :created, 
                      :location => @image }
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
        format.html { redirect_to(@image, 
                      :notice => 'Post was sucessfuly updated.') }
        format.json { head :no_content }
      else
        format.html  { render :action => "edit" }
        format.json  { render :json => @image.errors,
                       :status => :unprocessable_entity }
      end
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
