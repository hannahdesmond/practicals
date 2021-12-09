class SecretDiary
  attr_accessor :locked
  attr_accessor :entries

  def initialize
    @locked = true
    @entries = []
  end

  def unlock
    @locked = false
  end

  def lock
    @locked = true
  end
end

class NewEntry
  def add_entry(diary, string)
    diary.locked == false ? diary.entries << string : "This diary is locked. Keep out!"
  end
end


=begin
  def add_entry(string)
    @locked == false ? @entries << string : "This diary is locked. Keep out!"
  end

  def get_entries
    @locked == false ? @entries : "This diary is locked. Keep out!"  
  end
=end