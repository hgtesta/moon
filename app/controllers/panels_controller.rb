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
  
  def create
    @panel = Panel.new(params[:panel])
    if @panel.save
      redirect_to panels_path, :notice => "Panel successfully created"
    else
      render :new
    end
  end

end
