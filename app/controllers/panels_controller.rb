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
    respond_to do |format|
      format.html
      format.js { 
        @panel.dump_executions
        
        # [
        #   1 => [[1,:ok], [4, :timeout], [20, :ok], [23, :ok], [44, :ok], [56, :error]]
        #   2 => [[1,:ok], [4, :timeout], [20, :ok], [23, :ok], [44, :ok], [56, :error]]
        #   3 => [[1,:ok], [4, :timeout], [20, :ok], [23, :ok], [44, :ok], [56, :error]]
        # ]
        render :text => '{
          "foo": "The quick brown fox jumps over the lazy dog.",
          "bar": "ABCDEFG",
          "baz": [52, 97]
        }' 
      }
    end
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
