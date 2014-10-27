class Search
  attr_reader :term
  def initialize options = {}
    @term = options.fetch(:term, "")
  end

  def rants
    Rant.where("rant iLIKE ?", "%#{term}%")
  end
end