class ConferencesController < ApplicationController
  before_action :set_conference, only: [:show, :edit, :update, :destroy]

  # GET /conferences
  # GET /conferences.json
  def index
    @conferences = params[:search] ? Conference.search(params[:search]) :  Conference.all
    params[:search] ||= {}
  end

  # GET /conferences/1
  # GET /conferences/1.json
  def show
  end

  # GET /conferences/new
  def new
    @conference = Conference.new
  end

  # GET /conferences/1/edit
  def edit
  end

  # POST /conferences
  # POST /conferences.json
  def create
    @conference = Conference.new(conference_params)

    respond_to do |format|
      if @conference.save
        format.html { redirect_to @conference, notice: 'Conference was successfully created.' }
        format.json { render action: 'show', status: :created, location: @conference }
      else
        format.html { render action: 'new' }
        format.json { render json: @conference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conferences/1
  # PATCH/PUT /conferences/1.json
  def update
    respond_to do |format|
      if @conference.update(conference_params)
        format.html { redirect_to @conference, notice: 'Conference was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @conference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conferences/1
  # DELETE /conferences/1.json
  def destroy
    @conference.destroy
    respond_to do |format|
      format.html { redirect_to conferences_url }
      format.json { head :no_content }
    end
  end

  def update_location
    @conference = Conference.new(location: params[:location])
    @conference.geocode

    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conference
      @conference = Conference.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conference_params
      params.require(:conference).permit(:name, :start_date, :end_date, :location, :category, :safety_policy, :childcare, :airport_ids => [], :hotel_ids => [])
    end
end
