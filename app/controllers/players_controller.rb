class PlayersController < ApplicationController

  before_filter :signed_in_admin, only: [:create, :edit, :update]

  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      flash[:notice] = "Player '" + @player.name + "' successfully created."
      redirect_to players_path
    else
      render 'new'
    end
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    if @player.update_attributes(player_params)
      flash[:notice] = "Player '" + @player.name + "' updated."
      redirect_to players_path      
    else
      render 'edit'
    end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    flash[:notice] = "Player '" + @player.name + "' deleted."
    redirect_to players_path
  end

  private

    def player_params
      params.require(:player).permit(:name, :number, :classyear, :height, :hometown)
    end

    def signed_in_admin
      unless admin_logged_in?
        store_location
        redirect_to admin_login_url
      end
    end

end
