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

  def privacy_settings

     @user_list=User.all
    if params.has_key?(:term) && !params[:term].empty?
      q = "#{params[:term]}%"
      @user  = User.limit(10).where("username LIKE ?", q)

    end

     # respond in the right format
    respond_to do |format|
      # normal html layout
      format.html
      # json for jquery
      format.json do
        # make an array
        @user.map! do |u|
          {
                  :label => u.username,
                  :value => u.username
          }
        end
        render :json => @user
      end
    end

    @hide_people= "#{params[:term]}".split(/,\s*/)
    @specific_people= "#{params[:specific_people_of_list]}".split(/,\s*/)

     @hide_people.each do |hide|
       @user_list.each do |user|
         if (user.username == hide)
           @hide_user=hide
           @user_update = User.find_by_username(@hide_user)
           @user_update.visible = false
           @user_update.save
#           @privacy = current_user.user_privacy
#           @privacy.privacy_type = "custom"
#           @privacy.save

         end
       end
     end

     @specific_people.each do |specific|
       @user_list.each do |user|
         if (user.username == specific)
           @specific_user = specific
           @user_update = User.find_by_username(@specific_user)
           @user_update.visible = true
           @user_update.save
#           @privacy = current_user.user_privacy
#           @privacy.privacy_type = "custom"
#           @privacy.save
         end
       end
     end

  end

  def save
    if current_user.user_privacy.blank?
      @privacy = UserPrivacy.new
      @privacy.user_id = current_user.id
      @privacy.privacy_type = params[:user_privacy]
    else
      @privacy = current_user.user_privacy
      @privacy.privacy_type = params[:user_privacy]
    end
    if @privacy.save
      flash[:notice] = "Setting Saved Successfully"
      redirect_to :back
    else
      flash[:error] = "Failed"
      redirect_to :back
    end

  end
end
