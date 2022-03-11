class TodoList
  def initialize
    @complete = []
    @incomplete = []
  end

  def add(task)
    @incomplete << task
  end

  def complete
    sort_lists
    @complete
  end

  def incomplete
    sort_lists
    @incomplete
  end

  private

  def sort_lists
    @incomplete.each do |task|
      if task.done?
        @complete.push(task) 
        @incomplete.delete(task)
      end
    end
  end
end