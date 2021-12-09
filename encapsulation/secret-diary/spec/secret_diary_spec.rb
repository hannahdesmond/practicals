require 'secret_diary'

describe SecretDiary do
  let(:secretdiary) { SecretDiary.new }
    it 'unlocks' do
      secretdiary.locked = true
      secretdiary.unlock
      expect(secretdiary.locked).to eq(false)
    end
    it 'locks the diary' do
      secretdiary.lock
      expect(secretdiary.locked).to eq(true)
    end
  end

describe NewEntry do
  let(:secretdiary) { SecretDiary.new }
  context 'diary is unlocked' do 
    it 'should add an entry' do
      secretdiary.unlock
      subject.add_entry(secretdiary, "nice note")
      expect(secretdiary.entries).to eq(["nice note"])
    end
  end
  context 'diary is locked' do
    it 'throws an error' do 
      secretdiary.lock
      expect(subject.add_entry(secretdiary, "nice note")).to eq("This diary is locked. Keep out!")
    end
  end
end

describe GetEntries do
  let(:secretdiary) { SecretDiary.new }
  let(:entry) { NewEntry.new }
  def add_notes
    entry.add_entry(secretdiary, "note")
    entry.add_entry(secretdiary, "second note")  
  end
    context 'diary is unlocked' do 
      it 'should get the entries' do
        secretdiary.unlock
        add_notes
        expect(subject.get_entries(secretdiary)).to eq(["note", "second note"])
      end
    end
    context 'diary is locked' do
      it 'throws an error' do 
        secretdiary.lock
        add_notes
        expect(subject.get_entries(secretdiary)).to eq("This diary is locked. Keep out!")
      end
    end
end
