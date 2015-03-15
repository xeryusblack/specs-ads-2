class CompetitionDebtsController < ApplicationController
   load_and_authorize_resource
  def index
    @competition_debts = CompetitionDebt.all 

    render(:template => "competition_debts/index")
  end

  def show
    @competition_debt = CompetitionDebt.find(params[:id])
  end

  def new
    @competition_debt = CompetitionDebt.new

    render(:template => "competition_debts/new")
  end

  def create
    @competition_debt = CompetitionDebt.new(competition_debt_params)

    if @competition_debt.save
      redirect_to competition_debt_path(@competition_debt.id)
    else
      render(:template => "competition_debts/index")
    end
  end

  def edit
    @competition_debt = CompetitionDebt.find(params[:id])

    render(:templace => "competition_debts/edit")
  end

  def update
    @competition_debt = CompetitionDebt.find(params[:id])

    if @competition_debt.update(competition_debt_params)
      redirect_to competition_debt_path(@competition_debt)
    else
      render(:template => "competition_debts/edit")
    end
  end

  def destroy
    @competition_debt = CompetitionDebt.find(params[:id])
    @competition_debt.destroy!
    redirect_to competition_debts_path
  end

  def competition_debt_params
    params.require(:competition_debt).permit!
  end
end
