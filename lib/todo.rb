class Todo
  def initialize(task)
    fail "Error: no task given" if task.empty?
    @task = task
    @done = false
  end

  def task
    @task
  end

  def done?
    @done
  end

  def mark_done!
    @done = true
  end
end