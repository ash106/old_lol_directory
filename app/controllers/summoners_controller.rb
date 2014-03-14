class SummonersController < ApplicationController
  before_action :set_summoner, only: [:show, :edit, :update, :destroy]
  before_action :set_unirest_header, only: [:create, :update]

  # GET /summoners
  # GET /summoners.json
  def index
    @summoners = Summoner.all
  end

  # GET /summoners/1
  # GET /summoners/1.json
  def show
  end

  # GET /summoners/new
  def new
    @summoner = Summoner.new
  end

  # GET /summoners/1/edit
  def edit
  end

  # POST /summoners
  # POST /summoners.json
  def create
    server = params[:summoner][:server].downcase
    name = params[:summoner][:name].downcase

    @summoner = Summoner.new(summoner_params)
    @summoner.user_id = current_user.id

    search_string = "https://community-league-of-legends.p.mashape.com/api/v1.0/#{server}/summoner/getSummonerByName/#{name}"
    response = Unirest.get(search_string)

    if response.code == 200 && response.body["summonerLevel"] == 30
      @summoner.name = response.body["name"]
      @summoner.icon_id = response.body["profileIconId"]
      @summoner.riot_id = response.body["summonerId"]
      @summoner.acct_id = response.body["acctId"]
    end

    respond_to do |format|
      if @summoner.save
        format.html { redirect_to @summoner, notice: 'Summoner was successfully created.' }
        format.json { render action: 'show', status: :created, location: @summoner }
      else
        format.html { render action: 'new' }
        format.json { render json: @summoner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /summoners/1
  # PATCH/PUT /summoners/1.json
  def update
    respond_to do |format|
      if @summoner.update(summoner_params)
        format.html { redirect_to @summoner, notice: 'Summoner was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @summoner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /summoners/1
  # DELETE /summoners/1.json
  def destroy
    @summoner.destroy
    respond_to do |format|
      format.html { redirect_to summoners_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_summoner
      @summoner = Summoner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def summoner_params
      params.require(:summoner).permit(:name, :server, :icon_id, :riot_id, :acct_id, :user_id)
    end

    def set_unirest_header
      Unirest.default_header("X-Mashape-Authorization",ENV['MASHAPE_KEY'])
    end
end
