class ContingentsController < ApplicationController
   load_and_authorize_resource
  def index
    @contingents = Contingent.all 

    render(:template => "contingents/index")
  end

  def show
    @contingent = Contingent.find(params[:id])
  end

  def new
    @contingent = Contingent.new

    render(:template => "contingents/new")
  end

  def create
    @contingent = Contingent.new(contingent_params)

    if @contingent.save
      redirect_to contingent_path(@contingent.id)
    else
      render(:template => "contingents/index")
    end
  end

  def edit
    @contingent = Contingent.find(params[:id])

    render(:templace => "contingents/edit")
  end

  def update
    @contingent = Contingent.find(params[:id])

    if @contingent.update(contingent_params)
      redirect_to contingent_path(@contingent)
    else
      render(:template => "contingents/edit")
    end
  end

  def destroy
    @contingent = Contingent.find(params[:id])
    @contingent.destroy!
    redirect_to contingents_path
  end

  def contingent_params
    params.require(:contingent).permit!
  end
end
