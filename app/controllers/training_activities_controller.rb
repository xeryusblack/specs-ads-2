class TrainingActivitiesController < ApplicationController
   load_and_authorize_resource
  def index
    @training_activities = TrainingActivity.all 

    render(:template => "training_activities/index")
  end

  def show
    @training_activity = TrainingActivity.find(params[:id])
  end

  def new
    @training_activity = TrainingActivity.new

    render(:template => "training_activities/new")
  end

  def create
    @training_activity = TrainingActivity.new(training_activity_params)

    if @training_activity.save
      redirect_to training_activity_path(@training_activity.id)
    else
      render(:template => "training_activities/index")
    end
  end

  def edit
    @training_activity = TrainingActivity.find(params[:id])

    render(:templace => "training_activities/edit")
  end

  def update
    @training_activity = TrainingActivity.find(params[:id])

    if @training_activity.update(training_activity_params)
      redirect_to training_activity_path(@training_activity)
    else
      render(:template => "training_activities/edit")
    end
  end

  def destroy
    @training_activity = TrainingActivity.find(params[:id])
    @training_activity.destroy!
    redirect_to training_activities_path
  end

  def training_activity_params
    params.require(:training_activity).permit!
  end
end
