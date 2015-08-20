class CompetenciesController < ApplicationController
  include EmployeeAsParent

  before_action :set_competency, only: [:show, :edit, :update, :destroy]

  # GET /competencies
  # GET /competencies.json
  def index
    @search = Competency.search(params[:q])
    @results = @search.result.includes(:employee)
  end

  # GET /competencies/1
  # GET /competencies/1.json
  def show
  end

  # GET /competencies/new
  def new
    @competency = @parent.competencies.build
  end

  # GET /competencies/1/edit
  def edit
  end

  # POST /competencies
  # POST /competencies.json
  def create
    @competency = @parent.competencies.build(competency_params)

    respond_to do |format|
      if @competency.save
        format.html { redirect_to [@parent, @competency], notice: 'Competency was successfully created.' }
        format.json { render :show, status: :created, location: [@parent, @competency] }
      else
        format.html { render :new }
        format.json { render json: @competency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /competencies/1
  # PATCH/PUT /competencies/1.json
  def update
    respond_to do |format|
      if @competency.update(competency_params)
        format.html { redirect_to [@parent, @competency], notice: 'Competency was successfully updated.' }
        format.json { render :show, status: :ok, location: [@parent, @competency] }
      else
        format.html { render :edit }
        format.json { render json: @competency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /competencies/1
  # DELETE /competencies/1.json
  def destroy
    @competency.destroy
    respond_to do |format|
      format.html { redirect_to employee_competencies_path(@parent), notice: 'Competency was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competency
      @competency = @parent.competencies.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def competency_params
      params.require(:competency).permit(:name, :competency_type, :grade, :start_date, :end_date)
    end
end
