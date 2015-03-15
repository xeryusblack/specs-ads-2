class OfficerInChargesController < ApplicationController
  def index
    @officers_in_charge = OfficerInCharge.all 

    render(:template => "officer_in_charges/index")
  end

  def show
    @officer_in_charge = OfficerInCharge.find(params[:id])
  end

  def new
    @officer_in_charge = OfficerInCharge.new

    render(:template => "officer_in_charges/new")
  end

  def create
    @officer_in_charge = OfficerInCharge.new(officer_in_charge_params)

    if @officer_in_charge.save
      redirect_to officer_in_charge_path(@officer_in_charge.id)
    else
      render(:template => "officer_in_charges/index")
    end
  end

  def edit
    @officer_in_charge = OfficerInCharge.find(params[:id])

    render(:templace => "officer_in_charges/edit")
  end

  def update
    @officer_in_charge = OfficerInCharge.find(params[:id])

    if @officer_in_charge.update(officer_in_charge_params)
      redirect_to officer_in_charge_path(@officer_in_charge)
    else
      render(:template => "officer_in_charges/edit")
    end
  end

  def destroy
    @officer_in_charge = OfficerInCharge.find(params[:id])
    @officer_in_charge.destroy!
    redirect_to officer_in_charges_path
  end

  def officer_in_charge_params
    params.require(:officer_in_charge).permit( {:role_ids => []})
  end
end
