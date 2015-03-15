class DebtSettlementsController < ApplicationController
   load_and_authorize_resource
  def index
    @debt_settlements = DebtSettlement.all 

    render(:template => "debt_settlements/index")
  end

  def show
    @debt_settlement = DebtSettlement.find(params[:id])
  end

  def new
    @debt_settlement = DebtSettlement.new

    render(:template => "debt_settlements/new")
  end

  def create
    @debt_settlement = DebtSettlement.new(debt_settlement_params)

    if @debt_settlement.save
      redirect_to debt_settlement_path(@debt_settlement.id)
    else
      render(:template => "debt_settlements/index")
    end
  end

  def edit
    @debt_settlement = DebtSettlement.find(params[:id])

    render(:templace => "debt_settlements/edit")
  end

  def update
    @debt_settlement = DebtSettlement.find(params[:id])

    if @debt_settlement.update(debt_settlement_params)
      redirect_to debt_settlement_path(@debt_settlement)
    else
      render(:template => "debt_settlements/edit")
    end
  end

  def destroy
    @debt_settlement = DebtSettlement.find(params[:id])
    @debt_settlement.destroy!
    redirect_to debt_settlements_path
  end

  def debt_settlement_params
    params.require(:debt_settlement).permit!
  end
end
