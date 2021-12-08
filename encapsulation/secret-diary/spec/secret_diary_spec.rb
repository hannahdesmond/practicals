require 'secret_diary'

describe SecretDiary do
  let(:secretdiary) { SecretDiary.new }
  before do
    secretdiary.locked = true
  end
  context 'is locked' do
    it 'should return true' do
      expect(secretdiary.locked).to eq(true)
    end
    it 'should throw an error at #add_entry' do
      expect(secretdiary.add_entry("hello")).to eq("This diary is locked. Keep out!")  
    end
    it 'should throw an error at #add_entry' do
      expect(secretdiary.get_entries).to eq("This diary is locked. Keep out!")  
    end
  end
  context 'is unlocked' do
    before do
      secretdiary.unlock
    end
    it 'unlocks' do
      expect(secretdiary.locked).to eq(false)
    end
    it 'should add an entry' do
      secretdiary.add_entry("nice note")
      expect(secretdiary.entries).to eq(["nice note"])
    end
    it 'should get the entries' do
      secretdiary.add_entry("nice note")
      secretdiary.add_entry("another note")
      expect(secretdiary.get_entries).to eq(["nice note", "another note"])
    end
    it 'locks the diary' do
      secretdiary.lock
      expect(secretdiary.locked).to eq(true)
    end
  end
end
