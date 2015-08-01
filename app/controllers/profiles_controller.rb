class ProfilesController < ApplicationController
  def new
    # form where a user can fill out their own profile.
    @user = User.find( params[:user_id] )
    @variable = params[:hello]
    @profile = @user.build_profile
  end

  def create
    @user = User.find( params[:user_id] )
    @profile = @user.build_profile(profile_params)
    if @profile.save
      flash[:success] = "Profile Updated!"
      redirect_to user_path( params[:user_id] )
    else
      render action: :new
    end
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
  end
end
