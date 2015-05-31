class ReportsController < ApplicationController
  include EmployeeAsParent

  before_action :set_report, only: [:show, :edit, :update, :destroy]

  # GET /reports
  # GET /reports.json
  def index
    @reports = @parent.reports
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
  end

  # GET /reports/new
  def new
    @report = @parent.reports.build
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = @parent.reports.build(report_params)

    respond_to do |format|
      if @report.save
        format.html { redirect_to [@parent, @report], notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: [@parent, @report] }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to [@parent, @report], notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: [@parent, @report] }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to employee_reports_path(@parent), notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = @parent.reports.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:previous_date, :next_date, :mpar, :mpar_date)
    end
end
