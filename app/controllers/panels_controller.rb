class PanelsController < ApplicationController

  def index
    @panels = Panel.all
  end

  def show
    @panel = Panel.find(params[:id])
    @services = @panel.services
  end

end
