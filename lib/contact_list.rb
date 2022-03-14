class ContactList
  def initialize(diary)
    @diary = diary
    @contacts = []
  end

  def grab_contacts
    @diary.entries.each do |entry|
      @contacts << entry.contents.scan(/\d{11}/)
    end
  end

  def show_contacts
    @contacts.flatten.uniq
  end
end