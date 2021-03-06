class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]
  before_action :check_login
  
  
  # GET /links
  # GET /links.json
  def index
    if params[:user].present?
      @links = Link.where(user_id: params[:user]).reverse
      @user = User.find(@links.first.user.id)
    elsif params[:tag].present?
      @links = Link.tagged_with(params[:tag]).reverse
    else
      @links = Link.all.reverse
    end
  end

  # GET /links/1
  # GET /links/1.json
  def show
  end

  # GET /links/new
  def new
    @link = Link.new
  end

  # GET /links/1/edit
  def edit
  end

  # POST /links
  # POST /links.json
  def create
    @link = Link.new(link_params)
    @link.user_id = session[:user_id]

    respond_to do |format|
      if @link.save
        format.html { redirect_to links_url, notice: 'Thanks for submitting your link!' }
        format.json { render action: 'show', status: :created, location: @link }
      else
        format.html { render action: 'new' }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to @link, notice: 'Link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:url, :description, :tag_list, :title)
    end

  def check_login
    if !session[:user_id]
      redirect_to root_url
    end
  end
end
