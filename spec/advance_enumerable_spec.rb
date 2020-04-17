require '../advace_enumerable.rb'
RSpec.describe Enumerable do
  include Enumerable
  let(:arr) { [2, 1, 7] }
  describe '#my_each' do
    it 'performs operation on each element of array if block is given' do
      expect(arr.my_each { |x| puts x }).to eql(arr.each { |x| puts x })
    end
    it 'returns to_enum if no block is given' do
      expect(arr.my_each).to be_a(Enumerator)
    end
    it 'returns an error if an argument is given' do
      expect { arr.my_each(1) }.to raise_error(ArgumentError)
    end
    it 'returns an error if something else is given instead of an array' do
      expect { 1.my_each }.to raise_error(NoMethodError)
    end
  end

  describe '#my_each_with_index' do
    it 'performs operation on each element of array if block is given' do
      expect(arr.my_each_with_index { |x, n| puts x, n }).to eql(arr.each_with_index { |x, n| puts x, n })
    end
    it 'returns to_enum if no block is given' do
      expect(arr.my_each_with_index).to be_a(Enumerator)
    end
    it 'returns an error if an argument is given' do
      expect { arr.my_each_with_index(1) }.to raise_error(ArgumentError)
    end
    it 'returns an error if something else is given instead of an array' do
      expect { 1.my_each_with_index }.to raise_error(NoMethodError)
    end
  end

  describe '#my_all?' do
    it 'returns true if all the items of array satisfies the condition' do
      expect(arr.my_all? { |x| x < 1 }).to eql(arr.all? { |x| x < 1 })
    end
    it 'returns true if pattern is matched or array has all elements same as argument' do
      expect(arr.my_all?(/d/)).to eql(arr.all?(/d/))
    end
    it 'returns true if all the elements are true if we dont pass block and argument' do
      expect(arr.my_all?).to be true
    end
  end
end
