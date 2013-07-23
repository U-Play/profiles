class SportExperiencesController < ApplicationController
  attr_reader :sport_experience

  def create
    @sport_experience = current_user.sport_experiences.build params[:sport_experience]

    if @sport_experience.save
      redirect_to my_profile_path, :notice => t('sport_experience.new.success')
    else
      render :new
    end
  end

  def new
    @sport_experience = current_user.sport_experiences.build
  end
end