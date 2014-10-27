class Search
  attr_reader :term
  def initialize options = {}
    @term = options.fetch(:term, "")
  end

  def rants
    Rant.where("rant iLIKE ? OR title iLIKE ?", "%#{term}%", "%#{term}%")
  end

  def users
    User.where("username iLIKE ? OR first_name iLIKE ? OR last_name iLIKE ?", "%#{term}%", "%#{term}%", "%#{term}%")
  end
end