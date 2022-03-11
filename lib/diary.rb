class Diary
  def initialize
    @diary = []
  end

  def add(entry) 
    @diary << entry
  end

  def read(title) 
    @diary.each do |entry|
      return entry.contents if entry.title == title
    end
  end

  def recommend_entry(time, speed) # Time is time available for reading as an int
                                   # Speed is reading speed in words per minute as an int
    # Returns an array list of all entries that could be read within the given time
  end
end
