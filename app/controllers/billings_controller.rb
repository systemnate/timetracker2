class BillingsController < ApplicationController
  def new
  end

  def create
    @task_details = TaskDetail.where('created_at BETWEEN ? AND ?', 
      params[:start_date], params[:end_date]).order('created_at')
    render :show
  end

  def show
  end

private
  def report_params
    params.require(:report).permit(:start_date, :end_date, :pay_rate, :client)
  end
end