class ProfilesController < ApplicationController
    before_action :authenticate_user!
    before_action :find_profile, only:[:show,:edit, :update]

    def show
    end

    def new
        return redirect_to edit_profile_path(current_user.profile)if current_user.profile.present?
        @profile = Profile.new
    end

    def edit
    end

    def create
        @profile = Profile.new(profile_params)
        @profile.user = current_user
        if @profile.save
            redirect_to posts_path, notice:'プロフィールを登録しました。どうぞ楽しんでいってください'
        else
            render :new
        end
    end

    def updated
        if @profile.update(profile_params)
            redirect_to posts_path, notice:'プロフィールを更新しました'
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
            :name, :mania_histry, :enjoy_point, :image
        )
    end
end
