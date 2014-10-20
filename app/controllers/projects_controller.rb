class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_filter :check_staff_login, only: [:new, :edit, :destroy]

  # GET /projects
  # GET /projects.json
  def index
	  # if params[:title] || params[:description] || params[:procategory_id] || params[:min_price] || params[:max_price]
		 #  @projects = Project.search(params[:title], params[:description], params[:min_price], params[:max_price], params[:procategory_id]).joins(:procategory).where(["projects.share = ? and projects.status = ?
  	# 	and procategories.status = ? ", true, true, true])
		 #  flash[:notice] = "There are " + @projects.count.to_s + " projects"
		 #  @projects = @projects.page(params[:page]).per(2)
	  # else
		 #  @projects = Project.joins(:procategory).where(["projects.share = ? and projects.status = ? and procategories.status = ? ", true, true, true]).page(params[:page]).per(2)
	  # end

	  if user_signed_in? && current_user.is_staff?
			if params[:procategory_id]
				procategory_id = params[:procategory_id]
				procategory = Procategory.find(procategory_id)
				@projects = paginate(procategory.projects_user(current_user))
			else
				@projects = paginate(current_user.projects)
			end
	  else
			@projects = Project.all
		end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
		@lastest_attachment = @project.attachments.order(created_at: :asc).last
		@attachments = paginate(@project.attachments)
		@attachment = @project.attachments.new
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)
    @project.user = current_user

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :description, :procategory_id, :user_id, :photo)
    end

    def paginate(projects)
	    return projects.page(params[:page]).per(2)
    end
end
