module AdminHelper

  def disabled(user)
    if Disable.find_by(user_id: user.id)
      "true"
    end
  end

  def disable_button(user)
    button_to "Disable", user_disables_path(user.id)
  end

  def enable_button(user)
    button_to "Enable", user_disable_path(user_id: user.id, id: disable_id(user) ), method: :delete
  end

  def disable_id(user)
    Disable.find_by(user_id: user.id)
  end

  def user_disable(user)
    if disabled(user)
      enable_button(user)
    else
      disable_button(user)
    end
  end

end