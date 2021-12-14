
class SecretDiary 
  def initialize
    @entries = []
  end

  def add_entry(diary, string)
    diary.locked == false ? diary.entries << string : raise("This diary is locked. Keep out!")
  end

  def get_entries(diary)
    diary.locked == false ? diary.entries : raise("This diary is locked. Keep out!")
  end

end

class LockDiary
  attr_accessor :locked

  def initialize
    @locked = true
  end

  def unlock
    @locked = false
  end

  def lock
    @locked = true
  end

end