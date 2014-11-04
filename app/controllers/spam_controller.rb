class SpamController < ApplicationController

  def show
    @spam = Rant.spam
  end


end