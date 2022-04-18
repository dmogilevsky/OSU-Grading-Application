class GraderformsController < ApplicationController
  before_action :set_graderform, only: %i[ show edit update destroy ]

  # GET /graderforms or /graderforms.json
  def index
    @graderforms = Graderform.all
  end

  # GET /graderforms/1 or /graderforms/1.json
  def show
  end

  # GET /graderforms/new
  def new
    @graderform = Graderform.new
  end

  # GET /graderforms/1/edit
  def edit
  end

  # POST /graderforms or /graderforms.json
  def create
    @graderform = Graderform.new(graderform_params)

    respond_to do |format|
      if @graderform.save
        format.html { redirect_to graderform_url(@graderform), notice: "Graderform was successfully created." }
        format.json { render :show, status: :created, location: @graderform }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @graderform.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /graderforms/1 or /graderforms/1.json
  def update
    respond_to do |format|
      if @graderform.update(graderform_params)
        format.html { redirect_to graderform_url(@graderform), notice: "Graderform was successfully updated." }
        format.json { render :show, status: :ok, location: @graderform }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @graderform.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /graderforms/1 or /graderforms/1.json
  def destroy
    @graderform.destroy

    respond_to do |format|
      format.html { redirect_to graderforms_url, notice: "Graderform was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_graderform
      @graderform = Graderform.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def graderform_params
      params.fetch(:graderform, {})
    end
end
