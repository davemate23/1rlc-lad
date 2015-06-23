class MedicalRecordsController < ApplicationController
  include EmployeeAsParent

  before_action :set_medical_record, only: [:show, :edit, :update, :destroy]

  # GET /medical_records
  # GET /medical_records.json
  def index
    @search = MedicalRecord.search(params[:q])
    @results = @search.result.includes(:employee)
  end

  # GET /medical_records/1
  # GET /medical_records/1.json
  def show
  end

  # GET /medical_records/new
  def new
    @medical_record = @parent.medical_records.build
  end

  # GET /medical_records/1/edit
  def edit
  end

  # POST /medical_records
  # POST /medical_records.json
  def create
    @medical_record = @parent.medical_records.build(medical_record_params)

    respond_to do |format|
      if @medical_record.save
        format.html { redirect_to [@parent, @medical_record], notice: 'Medical record was successfully created.' }
        format.json { render :show, status: :created, location: [@parent, @medical_record] }
      else
        format.html { render :new }
        format.json { render json: @medical_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medical_records/1
  # PATCH/PUT /medical_records/1.json
  def update
    respond_to do |format|
      if @medical_record.update(medical_record_params)
        format.html { redirect_to [@parent, @medical_record], notice: 'Medical record was successfully updated.' }
        format.json { render :show, status: :ok, location: [@parent, @medical_record] }
      else
        format.html { render :edit }
        format.json { render json: @medical_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medical_records/1
  # DELETE /medical_records/1.json
  def destroy
    @medical_record.destroy
    respond_to do |format|
      format.html { redirect_to employee_medical_records_path(@parent), notice: 'Medical record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medical_record
      @medical_record = @parent.medical_records.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def medical_record_params
      params.require(:medical_record).permit(:employee)
    end
end
