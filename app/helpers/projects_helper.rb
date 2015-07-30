# Projects Helper
module ProjectsHelper
  def time_spent(project)
    time_spent = 0
    project.tasks.each do |t|
      t.task_details.each do |td|
        time_spent += td.time_spent
      end
    end
    number_with_precision(time_spent / 60.0, precision: 2)
  end

  def time_remaining(project)
    @allotted_time_hours = allotted_time_hours(project)
    @time_spent = time_spent(project)
    @time_remaining = @allotted_time_hours.to_f - @time_spent.to_f
    number_with_precision(@time_remaining, precision: 2)
  end

  def allotted_time_hours(project)
    project.allotted_time
  end
end
