class TodoItemsController < ApplicationController
  before_action :set_todo_list
  before_action :set_todo_item, except: [:create]
  def create
    @todo_item = @todo_list.todo_items.create(todo_item_params)
    respond_to do |format|
      format.html { redirect_to @todo_list }
      format.js
    end
  end

  def destroy
    @todo_item.destroy
    respond_to do |format|
      format.html { flash[:error] = "Todo item deleted!" }
      format.js
    end
  end

  def complete
    if @todo_item.completed_at.nil?
      @todo_item.update_attribute(:completed_at, Time.now)
    else
      @todo_item.completed_at = nil
      @todo_item.save
    end
    respond_to do |format|
      format.html { redirect_to @todo_list, flash: { success: "Todo Item updated!" } }
      format.js
    end
  end

  private

  def set_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end

  def set_todo_item
    @todo_item = @todo_list.todo_items.find(params[:id])    
  end

  def todo_item_params
    params[:todo_item].permit(:content)
  end
end
