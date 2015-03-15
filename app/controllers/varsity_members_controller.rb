class VarsityMembersController < ApplicationController
   load_and_authorize_resource
  def index
    @varsity_members = VarsityMember.all 

    render(:template => "varsity_members/index")
  end

  def show
    @varsity_member = VarsityMember.find(params[:id])
  end

  def new
    @varsity_member = VarsityMember.new

    render(:template => "varsity_members/new")
  end

  def create
    @varsity_member = VarsityMember.new(varsity_member_params)

    if @varsity_member.save
      redirect_to varsity_member_path(@varsity_member.id)
    else
      render(:template => "varsity_members/index")
    end
  end

  def edit
    @varsity_member = VarsityMember.find(params[:id])

    render(:templace => "varsity_members/edit")
  end

  def update
    @varsity_member = VarsityMember.find(params[:id])

    if @varsity_member.update(varsity_member_params)
      redirect_to varsity_member_path(@varsity_member)
    else
      render(:template => "varsity_members/edit")
    end
  end

  def destroy
    @varsity_member = VarsityMember.find(params[:id])
    @varsity_member.destroy!
    redirect_to varsity_members_path
  end

  def varsity_member_params
    params.require(:varsity_member).permit!
  end
end
