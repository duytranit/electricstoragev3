class ProcategoriesController < ApplicationController
  before_action :set_procategory, only: [:show, :edit, :update, :destroy]

  # GET /procategories
  # GET /procategories.json
  def index
		# @procategories = Procategory.all.page(params[:page]).per(20)
	  @procategories = procategories_follow_ddc_level(0).page(params[:page]).per(20)
  end

  # GET /procategories/1
  # GET /procategories/1.json
  def show
		# @procategories = active_procategories_follow_ddc_level(@procategory.level)
		@procategories = paginate(@procategory.cousin)
  end

  # GET /procategories/new
  def new
    @procategory = Procategory.new
  end

  # GET /procategories/1/edit
  def edit
  end

  # POST /procategories
  # POST /procategories.json
  def create
    @procategory = Procategory.new(procategory_params)

    respond_to do |format|
      if @procategory.save
        format.html { redirect_to @procategory, notice: 'Procategory was successfully created.' }
        format.json { render :show, status: :created, location: @procategory }
      else
        format.html { render :new }
        format.json { render json: @procategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /procategories/1
  # PATCH/PUT /procategories/1.json
  def update
    respond_to do |format|
      if @procategory.update(procategory_params)
        format.html { redirect_to @procategory, notice: 'Procategory was successfully updated.' }
        format.json { render :show, status: :ok, location: @procategory }
      else
        format.html { render :edit }
        format.json { render json: @procategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /procategories/1
  # DELETE /procategories/1.json
  def destroy
    @procategory.destroy
    respond_to do |format|
      format.html { redirect_to procategories_url_url, notice: 'Procategory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_procategory
    @procategory = Procategory.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def project_params
    params.require(:procategory).permit(:name, :description, :ddc, :status)
  end

  def procategories_follow_ddc_level(level)
	  level += 2
	  return Procategory.where(["SUBSTR(ddc,?,1) = ?", level, '0'])
  end

	def paginate(procategories)
		return procategories.page(params[:page]).per(20)
	end
end
