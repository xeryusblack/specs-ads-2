class TryoutIntentsController < ApplicationController
   load_and_authorize_resource
  def index
    @tryout_intents = TryoutIntent.all 

    render(:template => "tryout_intents/index")
  end

  def show
    @tryout_intent = TryoutIntent.find(params[:id])
  end

  def new
    @tryout_intent = TryoutIntent.new

    render(:template => "tryout_intents/new")
  end

  def create
    @tryout_intent = TryoutIntent.new(tryout_intent_params)

    if @tryout_intent.save
      redirect_to tryout_intent_path(@tryout_intent.id)
    else
      render(:template => "tryout_intents/index")
    end
  end

  def edit
    @tryout_intent = TryoutIntent.find(params[:id])

    render(:templace => "tryout_intents/edit")
  end

  def update
    @tryout_intent = TryoutIntent.find(params[:id])

    if @tryout_intent.update(tryout_intent_params)
      redirect_to tryout_intent_path(@tryout_intent)
    else
      render(:template => "tryout_intents/edit")
    end
  end

  def destroy
    @tryout_intent = TryoutIntent.find(params[:id])
    @tryout_intent.destroy!
    redirect_to tryout_intents_path
  end

  def tryout_intent_params
    params.require(:tryout_intent).permit!
  end
end
