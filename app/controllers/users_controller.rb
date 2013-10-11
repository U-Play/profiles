class UsersController < ApplicationController

  layout 'profile'

  def view
    @user = present User.find params[:id]
    authorize! :read, @user
    set_new_team
  end

  def view_by_username
    @user = present User.find_by_username(params[:username])
    authorize! :read, @user

    if @user
      set_new_team
      render :view
    else
      not_found("username #{params[:username]} does not exist")
    end
  end

  def me
    authorize! :me, signed_user
    flash.keep
    redirect_to user_path(signed_user)
  end

  def edit
    @user = signed_user
    authorize! :edit, @user
  end

  def update
    authorize! :update, signed_user
    @update_user = Services::UpdateUser.new(signed_user, params[:user])

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
    if @user == signed_user
      params = flash[:new_team_params]
      @user.set_new_team_hide(params)
      @new_team = present signed_user.target.teams.build(params)
      @new_team.target.tournaments.build if @new_team.tournaments.empty?
    end
  end

end
