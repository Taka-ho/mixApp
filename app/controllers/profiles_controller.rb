class ProfilesController < ApplicationController
    before_action :authenticate_user!
    before_action :find_profile, only:[:show,:edit, :update]

    def show
    end

    def new
    @profile = Profile.new
    end

    def edit
    end

    def create
        @profile = Profile.new(profile_params)
        @profile.user = current_user
        if @profile.save
            redirect_to root_path, notice:'プロフィールを登録しました。どうぞ楽しんでいってください'
        else
            render :new
        end
    end

    def updated
        if @profile.update(profile_params)
            redirect_to root_path, notice:'プロフィールを更新しました'
        else
            render :edit
        end
    end

    private

    def find_profile
        @profile = Profile.find(params[:id])

    end

    def profile_params
        params.require(:profile).permit(
            :name, :leaning_histry, :purpose, :image
        )
    end
end
