class RssController < ApplicationController
  def index
    @sites = Site.all
    @tasks = Task.all
  end

end
