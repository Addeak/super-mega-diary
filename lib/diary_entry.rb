class DiaryEntry
  def initialize(title, contents)
    @title = title
    @contents = contents
  end

  def title
    @title
  end

  def contents
    @contents
  end

  def reading_time(speed) # Speed is reading speed in words per minute as an int
  # Returns time to read the entry in minutes as an int
  end

  def count_words
  # Returns number of words in contents as an int
  end
end