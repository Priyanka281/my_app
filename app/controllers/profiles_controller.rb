class ProfilesController < ApplicationController


  def index
    @profiles=Profile.all
  end

  def new
    @profile=Profile.new
  end
  
  def edit
    @profile = Profile.find(params[:id])
  end  

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      flash[:notice] = 'Profile created successfully '
      redirect_to @profile
    else
      render :new
    end
  end  

  def show
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
       redirect_to @profile
    else 
       render :edit
    end
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    redirect_to profiles_url
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:name, :phone)
    end


end
