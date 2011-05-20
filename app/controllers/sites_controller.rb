class SitesController < ApplicationController
  
  before_filter :set_sites
  
  def index
    @sites = Site.all
  end

  def new
    @site = Site.new
    
    render :layout => "false"
  end

  def create
    @site = Site.new(params[:site])
    if @site.save
      flash[:notice] = "Successfully created site."
      redirect_to(sites_path)
    else
      render :action => 'new'
    end
  end

  def edit
    @site = Site.find_by_name(params[:id])
  end

  def update
    @site = Site.find_by_name(params[:id])
    if @site.update_attributes(params[:site])
      flash[:notice] = "Successfully updated site."
      redirect_to(sites_path)
    else
      render :action => 'edit'
    end
  end

  def destroy
    @site = Site.find_by_name(params[:id])
    @site.destroy
    flash[:notice] = "Successfully destroyed site."
    redirect_to(sites_path)
  end
end
