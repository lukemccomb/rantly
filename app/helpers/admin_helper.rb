module AdminHelper

  def disabled(user)
    if Disable.find_by(user_id: user.id)
      "✔"
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

  def impersonate(user)
    button_to "Impersonate", impersonations_path(user_id: user.id), method: :post
  end

  def impersonation?
    if session[:impersonate]
     render :inline => "| <%= link_to 'Revert to Admin', impersonation_path(id: #{session[:user_id]}), method: :delete %>"
    end

    end

  def sorting(asc_or_desc)
    opposite, arrow = if asc_or_desc.nil? || asc_or_desc == "DESC"
                             ["ASC", "☟"]
                           else
                             ["DESC", "☝"]
                           end

    link_to "#{arrow}", "#{request.path}?sort=#{opposite}"
  end

end