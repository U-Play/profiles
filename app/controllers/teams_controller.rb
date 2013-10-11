class TeamsController < ApplicationController

  layout 'profile'

  before_filter :load_user, only: [:edit]
  before_filter :sanitize_empty_tournaments, only: [:create, :update]
  before_filter :check_for_cancel, only: [:create, :update]

  def create
    @team = current_user.teams.build params[:team]

    if @team.save
      mixpanel = MixpanelTracker.new user: current_user
      mixpanel.add_team

      redirect_to my_profile_path, :notice => t('team.new.success')
    else
      flash[:new_team_params] = params[:team]
      redirect_to my_profile_path, :alert => @team.errors.full_messages.first
    end
  end

  def edit
    @team = present Team.find(params[:id])
    authorize! :manage, @team
  end

  def update
    @team = present Team.find(params[:id])
    authorize! :manage, @team

    if @team.update_attributes(params[:team])
      mixpanel = MixpanelTracker.new(user: current_user)
      mixpanel.update_team

      redirect_to my_profile_path, notice: t('team.edit.success')
    else
      flash.now[:alert] = @team.errors.full_messages.first
      render :edit
    end
  end

  def destroy
    @team = present Team.find(params[:id])
    authorize! :manage, @team
    @team.destroy
    redirect_to my_profile_path, notice: t('team.destroy.success')
  end

  private

  def sanitize_empty_tournaments
    return if params[:team][:tournaments_attributes].nil?
    params[:team][:tournaments_attributes].each do |key, tournament|
      if tournament["name"].blank? && tournament["achievements"].blank? && tournament["award_year"].blank?
        params[:team][:tournaments_attributes].delete key
      end
    end
  end

  def check_for_cancel
    if params[:commit].try(:downcase) == 'cancel'
      redirect_to my_profile_path
    end
  end

  def load_user
    @user = signed_user
  end
end
