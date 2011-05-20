class TasksController < ApplicationController
  
  before_filter :set_site
  before_filter :set_sites

  def index
    @complete_tasks = @site.tasks.find(:all, :conditions => {:complete => true}, :order => "position")
    @incomplete_tasks = @site.tasks.find(:all, :conditions => ["complete is null OR complete = ?", false], :order => "position")
  end
  
  def show
    @task = @site.tasks.find(params[:id])
    render :layout => "false"
  end

  def new
    @task = @site.tasks.new
    render :layout => "false"
  end

  def create
    @task = @site.tasks.build(params[:task])
    @task.save
    @incomplete_tasks = @site.tasks.find(:all, :conditions => ["complete is null OR complete = ?", false])
    respond_to do |wants|
      wants.js
    end
  end

  def edit
    @task = Task.find(params[:id])
    render :layout => "false"
  end

  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      flash[:notice] = "Successfully updated task."
      redirect_to(site_tasks_path)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @task = @site.tasks.find(params[:id])
    @task.destroy
    respond_to do |wants|
      wants.js
    end
  end
  
  def prioritize_tasks
    @tasks = @site.tasks
    params[:task].each_with_index do |id, index|
      @tasks.update_all(['position=?', index+1], ['id=?', id])
    end
      render :nothing => true
  end
  
  def task_change
    @task = @site.tasks.find(params[:id])
    if @task.complete
      @task.update_attribute(:complete, false)
    else
      @task.update_attribute(:complete, true)
    end
    respond_to do |wants|
      wants.js
    end
  end
  
  def bare
    @complete_tasks = @site.tasks.find(:all, :conditions => {:complete => true}, :order => "position")
    @incomplete_tasks = @site.tasks.find(:all, :conditions => ["complete is null OR complete = ?", false], :order => "position")
    render :layout => "bare"
  end
  
  
  
  
  
  
end
