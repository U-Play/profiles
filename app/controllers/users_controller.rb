class UsersController < ApplicationController

  layout 'profile'

  def view
    @user = User.find params[:id]
    authorize! :read, @user

    if @user == current_user
      redirect_to my_profile_path
    end
  end

  def me
    @user = current_user
    authorize! :me, @user

    set_new_sport_experience

    render :view
  end

  def edit
    @user = current_user
    authorize! :edit, @user
  end

  def update
    @user = current_user
    authorize! :update, @user

    if @user.update_attributes(params[:user].merge(profile_finished: true))
      redirect_to my_profile_path, notice: t('user.edit.success')
    else
      set_user_errors
      render :edit
    end
  end

  private

  def set_user_errors
    flash.now[:alert] = @user.errors.full_messages.first
  end

  def set_new_sport_experience
    params = flash[:new_sport_experience_params]
    @experience_form_hide = params.nil?
    @new_sport_experience = current_user.sport_experiences.build(params)
  end

end
