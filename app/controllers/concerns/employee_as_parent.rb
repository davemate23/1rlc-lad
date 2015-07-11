module EmployeeAsParent
  extend ActiveSupport::Concern

  included do
    load_and_authorize_resource through: :current_employee#, shallow: true

    before_action :set_parent
  end

  def set_parent
    @parent = Employee.find(params[:employee_id])
  end
end
