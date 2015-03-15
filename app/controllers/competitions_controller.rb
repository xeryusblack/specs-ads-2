class CompetitionsController < ApplicationController
   load_and_authorize_resource
  def index
    @competitions = Competition.all 

    render(:template => "competitions/index")
  end

  def show
    @competition = Competition.find(params[:id])
  end

  def new
    @competition = Competition.new

    render(:template => "competitions/new")
  end

  def create
    @competition = Competition.new(competition_params)

    if @competition.save
      redirect_to competition_path(@competition.id)
    else
      render(:template => "competitions/index")
    end
  end

  def edit
    @competition = Competition.find(params[:id])

    render(:templace => "competitions/edit")
  end

  def update
    @competition = Competition.find(params[:id])

    if @competition.update(competition_params)
      redirect_to competition_path(@competition)
    else
      render(:template => "competitions/edit")
    end
  end

  def destroy
    @competition = Competition.find(params[:id])
    @competition.destroy!
    redirect_to competitions_path
  end

  def competition_params
    params.require(:competition).permit!
  end
end
