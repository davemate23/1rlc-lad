module EmployeeAsParent
  extend ActiveSupport::Concern

  included do
    load_and_authorize_resource :employee
    load_and_authorize_resource through: :employee

    before_action :set_parent
  end

  def set_parent
    @parent = Employee.find(params[:employee_id])
  end
end
