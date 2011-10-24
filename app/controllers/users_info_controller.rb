class UsersInfoController < ApplicationController
  def index
    unless current_user.blank?
    @users_info = current_user.users_info || UsersInfo.new
    @users_work = current_user.users_work || UsersWork.new
    @users_address = current_user.users_address || UsersAddress.new
    @users_education = current_user.users_education || UsersEducation.new
    @users_phone = current_user.users_phone || UsersPhone.new    
    @users_profile_picture = current_user.users_profile_picture || UsersProfilePicture.new    
    @users_setting = current_user.users_setting || UsersSetting.new
      end
  end

  def update_profile
    unless current_user.users_info.blank?
     current_user.users_info.update_attributes(params[:users_info])
    else
      current_user.users_info = UsersInfo.new(params[:users_info])
    end

    unless current_user.users_work.blank?
     current_user.users_work.update_attributes(params[:users_work])
    else
      current_user.users_work = UsersWork.new(params[:users_work])
    end

    unless current_user.users_address.blank?
      current_user.users_address.update_attributes(params[:users_address])
    else
      current_user.users_address = UsersAddress.new(params[:users_address])
    end

    unless current_user.users_education.blank?
     current_user.users_education.update_attributes(params[:users_education])
    else
      current_user.users_education = UsersEducation.new(params[:users_education])
    end

    unless current_user.users_phone.blank?
     current_user.users_phone.update_attributes(params[:users_phone])
    else
      current_user.users_phone = UsersPhone.new(params[:users_phone])
    end

    unless current_user.users_profile_picture.blank?
     current_user.users_profile_picture.update_attributes(params[:users_profile_picture])
    else
      current_user.users_profile_picture = UsersProfilePicture.new(params[:users_profile_picture])
    end

     unless current_user.users_setting.blank?
     current_user.users_setting.update_attributes(params[:users_setting])
    else
      current_user.users_setting = UsersSetting.new(params[:users_setting])
    end

    
    redirect_to home_path
  end
end
