class ExperiencesController < ApplicationController

  layout 'profile'

  before_filter :sanitize_empty_tournaments, only: [:create, :update]

  def create
    @experience = current_user.experiences.build params[:experience]

    if @experience.save
      redirect_to my_profile_path, :notice => t('experience.new.success')
    else
      flash[:new_experience_params] = params[:experience]
      redirect_to my_profile_path, :alert => @experience.errors.full_messages.first
    end
  end

  def edit
    @experience = Experience.find(params[:id])
    authorize! :manage, @experience
  end

  def update
    @experience = Experience.find(params[:id])
    authorize! :manage, @experience

    if @experience.update_attributes(params[:experience])
      redirect_to my_profile_path, notice: t('experience.edit.success')
    else
      flash.now[:alert] = @experience.errors.full_messages.first
      render :edit
    end
  end

  def sanitize_empty_tournaments
    params[:experience][:tournaments_attributes].each do |key, tournament|
      if tournament["name"].empty? && tournament["achievements"].empty? && tournament["award_date(1i)"].empty?
        params[:experience][:tournaments_attributes].delete key
      end
    end
  end
end
