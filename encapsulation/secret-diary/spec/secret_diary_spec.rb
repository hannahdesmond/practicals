require 'secret_diary'

describe SecretDiary do
  let(:secretdiary) { SecretDiary.new }
  before do
    secretdiary.lock = true
  end
  context 'is locked' do
    it 'should return true' do
      expect(secretdiary.lock).to eq(true)
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
      expect(secretdiary.lock).to eq(false)
    end
    it 'should add an entry' do
      expect(secretdiary.add_entry("nice note")).to eq("nice note")
    end
  end
end
