class PageController < ApplicationController
  # dosn't allow the user to actually use page unless they are loged in
  ##### before_action authenticate, only:[:contact] #####

  def home
  end
end
