class AcquiredQuotaPointsController < ApplicationController
   load_and_authorize_resource
  def index
    @acquired_quota_points = AcquiredQuotaPoint.all 

    render(:template => "acquired_quota_points/index")
  end

  def show
    @acquired_quota_point = AcquiredQuotaPoint.find(params[:id])
  end

  def new
    @acquired_quota_point = AcquiredQuotaPoint.new

    render(:template => "acquired_quota_points/new")
  end

  def create
    @acquired_quota_point = AcquiredQuotaPoint.new(acquired_quota_point_params)

    if @acquired_quota_point.save
      redirect_to acquired_quota_point_path(@acquired_quota_point.id)
    else
      render(:template => "acquired_quota_points/index")
    end
  end

  def edit
    @acquired_quota_point = AcquiredQuotaPoint.find(params[:id])

    render(:templace => "acquired_quota_points/edit")
  end

  def update
    @acquired_quota_point = AcquiredQuotaPoint.find(params[:id])

    if @acquired_quota_point.update(acquired_quota_point_params)
      redirect_to acquired_quota_point_path(@acquired_quota_point)
    else
      render(:template => "acquired_quota_points/edit")
    end
  end

  def destroy
    @acquired_quota_point = AcquiredQuotaPoint.find(params[:id])
    @acquired_quota_point.destroy!
    redirect_to acquired_quota_points_path
  end

  def acquired_quota_point_params
    params.require(:acquired_quota_point).permit!
  end
end
