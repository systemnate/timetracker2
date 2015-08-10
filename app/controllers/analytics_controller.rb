class AnalyticsController < ApplicationController
  def show
    @tasks_by_client = Hash.new(0)
    @tasks_by_user = Hash.new(0)
    @tasks_by_product = Hash.new(0)
    @tasks_created_last_week = Hash.new(0)
    @tasks = Task.includes(:client, :product)
    @tasks.each do |t|
      user = User.find(t.assigned_to).name
      if !@tasks_by_client.has_key?(t.client.name)
        @tasks_by_client[t.client.name] = 1
      else
        @tasks_by_client[t.client.name] += 1
      end

      if !@tasks_by_user.has_key?(user)
        @tasks_by_user[user] = 1
      else
        @tasks_by_user[user] += 1
      end

      if !@tasks_by_product.has_key?(t.product.name)
        @tasks_by_product[t.product.name] = 1
      else
        @tasks_by_product[t.product.name] += 1
      end

      if t.created_at >= 7.days.ago
        if !@tasks_created_last_week.has_key?(t.created_at.to_date)
          @tasks_created_last_week[t.created_at.to_date] = 1
        else
          @tasks_created_last_week[t.created_at.to_date] += 1
        end
      end
    end
    @average_handle_time = {}
    User.all.each do |u|
      @average_handle_time[u.name + "(" + u.email + ")"] = u.average_handle_time
    end
  end
end
