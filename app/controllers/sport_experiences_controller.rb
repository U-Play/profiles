class SportExperiencesController < ApplicationController

  layout 'profile'

  def create
    @sport_experience = current_user.sport_experiences.build params[:sport_experience]

    if @sport_experience.save
      redirect_to my_profile_path, :notice => t('experience.new.success')
    else
      flash[:new_sport_experience_params] = params[:sport_experience]
      redirect_to my_profile_path, :alert => @sport_experience.errors.full_messages.first
    end
  end

  def edit
    @experience = SportExperience.find(params[:id])
    authorize! :manage, @experience
  end

  def update
    @experience = SportExperience.find(params[:id])
    authorize! :manage, @experience

    if @experience.update_attributes(params[:sport_experience])
      redirect_to my_profile_path, notice: t('experience.edit.success')
    else
      render :edit
    end
  end
end
