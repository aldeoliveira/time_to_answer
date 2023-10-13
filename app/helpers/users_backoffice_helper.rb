module UsersBackofficeHelper
  def user_name
    if (current_user.first_name||current_user.last_name)
      current_user.full_name
    else
      current_user.email
    end
  end

  def avatar_url
    avatar = current_user.user_profile.avatar
    avatar.attached? ? avatar : 'img.jpg'
  end
end
