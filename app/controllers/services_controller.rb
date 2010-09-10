class ServicesController < ApplicationController

  def index
    @panel = Panel.find(params[:panel_id])
    @services = @panel.services
  end

  def new
    @panel = Panel.find(params[:panel_id])
    @service = @panel.services.build
    @service.timeout = 10
  end

  def create
    @panel = Panel.find params[:panel_id]
    @service = Service.new params[:service]
    if @panel.services << @service
      redirect_to panel_services_path(@panel), :notice => "Service successfully created"
    else
      render :new
    end
  end

  def edit
    @panel = Panel.find(params[:panel_id])
    @service = Service.find(params[:id])
 end

  def update
    @service = Service.find(params[:id])
    if @service.update_attributes(params[:service])
      redirect_to panel_services_path(@panel), :notice => "Service successfully updated"
    else
      render :edit
    end
  end
end










