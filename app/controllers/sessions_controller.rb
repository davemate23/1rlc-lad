class SessionsController < ApplicationController

  def new
  end

  def create
    employee = Employee.find_by(service_no: params[:session][:service_no])
    if employee && employee.authenticate(params[:session][:password])
      log_in employee
      params[:session][:remember_me] == '1' ? remember(employee) : forget(employee)
      redirect_back_or employee
      # Log the employee in and redirect to the employee's show page.
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid Service Number/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
