class SearchesController < ApplicationController
  def new
    @search = Search.new
  end

  def create
    @search = Search.create!(search_params)
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])
  end

private

  def search_params
    params.require(:search).permit(:task_id, :alternate_id, :keywords,
      :status_id, :product_id, :priority_id, :client_id, :created_at,
      :updated_at, :assigned_to, :created_by, :billable, :project_id)
  end
end