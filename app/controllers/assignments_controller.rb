class AssignmentsController < ApplicationController
  include EmployeeAsParent

  before_action :set_assignment, only: [:edit, :destroy, :update]

  def index
    @assignments = @parent.assignments
	end

	def new
		@assignment = @parent.assignments.build
	end

	def create
		@assignment = @parent.assignments.build(assignment_params)

    if @assignment.save
      redirect_to employee_assignments_path(@parent), notice: 'Assignment was successfully created.'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @assignment.update(assignment_params)
      redirect_to employee_assignments_path(@parent), notice: "Assignment was successfully updated."
    else
      render :edit
    end
  end

  def destroy
  	@parent.assignments.find(params[:id]).destroy

    respond_to do |format|
      format.html { redirect_to employee_assignments_path(@parent), notice: "Assignment was successfully removed." }
      format.json { head :no_content }
    end
	end

private

  def assignment_params
    params.require(:assignment).permit(:role_id, :start_date, :end_date)
  end

  def set_assignment
    @assignment = @parent.assignments.find(params[:id])
  end
end
