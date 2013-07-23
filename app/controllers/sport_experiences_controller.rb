class SportExperiencesController < ApplicationController
  def create
    @sport_experience = current_user.sport_experiences.build params[:sport_experience]

    if @sport_experience.save
      redirect_to my_profile_path, :notice => t('experience.new.success')
    else
      redirect_to my_profile_path, :alert => @sport_experience.errors.full_messages.first
    end
  end

  def new
    @sport_experience = current_user.sport_experiences.build
  end
end
