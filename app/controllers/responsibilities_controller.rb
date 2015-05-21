class ResponsibilitiesController < ApplicationController
  include EmployeeAsParent

  before_action :set_responsibility, only: [:show, :edit, :update, :destroy]

  # GET /responsibilities
  # GET /responsibilities.json
  def index
    @responsibilities = @parent.responsibilities
  end

  # GET /responsibilities/1
  # GET /responsibilities/1.json
  def show
  end

  # GET /responsibilities/new
  def new
    @responsibility = @parent.responsibilities.build
  end

  # GET /responsibilities/1/edit
  def edit
  end

  # POST /responsibilities
  # POST /responsibilities.json
  def create
    @responsibility = @parent.responsibilities.build(responsibility_params)

    respond_to do |format|
      if @responsibility.save
        format.html { redirect_to [@parent, @responsibility], notice: 'Responsibility was successfully created.' }
        format.json { render :show, status: :created, location: [@parent, @responsibility] }
      else
        format.html { render :new }
        format.json { render json: @responsibility.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /responsibilities/1
  # PATCH/PUT /responsibilities/1.json
  def update
    respond_to do |format|
      if @responsibility.update(responsibility_params)
        format.html { redirect_to [@parent, @responsibility], notice: 'Responsibility was successfully updated.' }
        format.json { render :show, status: :ok, location: [@parent, @responsibility] }
      else
        format.html { render :edit }
        format.json { render json: @responsibility.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responsibilities/1
  # DELETE /responsibilities/1.json
  def destroy
    @responsibility.destroy
    respond_to do |format|
      format.html { redirect_to employee_responsibilities_path(@parent), notice: 'Responsibility was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_responsibility
      @responsibility = @parent.responsibilities.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def responsibility_params
      params.require(:responsibility).permit(:employee_id, :name, :description)
    end
end
