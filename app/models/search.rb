class Search
  attr_reader :term
  def initialize options = {}
    @term = options.fetch(:term, "")
  end

  def rants
    Rant.where("rant iLIKE ? OR title iLIKE ?", "%#{term}%", "%#{term}%")
    # Model.where("name LIKE ? OR last_name LIKE ? OR first_name LIKE ?", "%#{search}%","%#{search}%","%#{search}%")
  end
end