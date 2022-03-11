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

  def count_words
    @contents.split.count
  end

  def reading_time(speed) 
    (count_words / speed.to_f).ceil
  end
end