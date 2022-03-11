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

  def recommend_entry(time, speed) 
    recommended = []
    readable_words = time * speed
    @diary.each do |entry|
      if entry.count_words <= readable_words
        recommended << entry.title 
      end
    end
    recommended
  end
end
