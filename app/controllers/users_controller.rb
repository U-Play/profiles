class UsersController < ApplicationController

  layout 'profile'

  def view
    @user = User.find params[:id]
    authorize! :read, @user
    set_new_team
  end

  def view_by_username
    @user = User.find_by_username(params[:username])
    authorize! :read, @user

    if @user
      set_new_team
      render :view
    else
      not_found("username #{params[:username]} does not exist")
    end
  end

  def me
    authorize! :me, current_user
    flash.keep
    redirect_to user_path(current_user)
  end

  def edit
    @user = current_user
    authorize! :edit, @user
  end

  def update
    authorize! :update, current_user
    @update_user = Services::UpdateUser.new(current_user, params[:user])

    @user = @update_user.update
    if @update_user.succeeded?
      redirect_to my_profile_path, notice: t('user.edit.success')
    else
      flash.now[:alert] = @update_user.errors
      render :edit
    end
  end

  private

  def set_new_team
    if @user == current_user
      params = flash[:new_team_params]
      @team_hide = @user.teams.any? && params.nil?
      @new_team = current_user.teams.build(params)
      @new_team.tournaments.build if @new_team.tournaments.empty?
    end
  end

end
