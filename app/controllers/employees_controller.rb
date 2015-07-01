class EmployeesController < ApplicationController
  load_and_authorize_resource

  before_action :set_employee, only: [:show, :edit, :update, :destroy, :activate]

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.where.not(id: current_employee.id).paginate(page: params[:page])
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    @employee = Employee.find(params[:id])
    @phones = @employee.phones
    @parent = @employee
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
     @employee = Employee.find(params[:id])
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to employee_assignments_path(@employee), notice: "Employee was successfully created."
    else
      render 'new'
    end
  end

  def activate
    @employee.update(activated: !@employee.activated)

    if @employee.activated
      flash[:notice] = "Employee was successfully activated."
    else
      flash[:notice] = "Employee was successfully deactivated."
    end

    redirect_to employees_url
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)

        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy

    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private

  def set_employee
    @employee = Employee.find(params[:id] || params[:employee_id])
  end

  def employee_params
    params.require(:employee).permit(:avatar, :email, :first_name, :last_name, :service_no, :password, :password_confirmation, :date_of_birth, :gender, :service_start_date, :substantive_rank, :promotion_date, :passport_number, :passport_expiry, :passport_country_of_origin, :nationality, :national_insurance)
  end
end
