class PagesController < ApplicationController
  before_action :authorize, except: [:about]
  def index
  end

  def about
  end

end
