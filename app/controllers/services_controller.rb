class ServicesController < ApplicationController

  def index
    @services = Service.all
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new params[:service]
    if @service.save
      redirect_to services_path, :notice => "Service successfully created"
    else
      render :new
    end
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    if @service.update_attributes(params[:service])
      redirect_to services_path, :notice => "Service successfully updated"
    else
      render :edit
    end
  end
end










