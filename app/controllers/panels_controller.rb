class PanelsController < ApplicationController
  
  def new
    @panel = Panel.new
    @services = Service.all
  end

  def index
    @panels = Panel.all
  end

  def show
    @panel = Panel.find(params[:id])
    @services = @panel.services
  end

end
