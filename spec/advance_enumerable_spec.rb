require '../advace_enumerable.rb'
RSpec.describe Enumerable do
  include Enumerable
  let(:arr) { [2, 1, 7] }
  let(:multiply) do
    proc do |x|
      x * 3
    end
  end
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

  describe '#my_count' do
    it 'counts the items of an array' do
      expect(arr.my_count).to eql(arr.count)
    end
    it 'returns the amount of times an item is in an array if an argument is passed' do
      expect(arr.my_count(2)).to eql(1)
    end
    it 'returns the amount of times a condition is satisfied by each element of array' do
      expect(arr.my_count(&:even?)).to be 1
    end
  end

  describe '#my_map' do
    it 'performs operation on each element of array if block is given with no proc and returns the array' do
      expect(arr.my_map { |x| x * 2 }).to eql(arr.map { |x| x * 2 })
    end
    it 'returns to_enum if no block is given' do
      expect(arr.my_map).to be_a(Enumerator)
    end
    it 'performs the proc operation if block and proc are given' do
      expect(arr.my_map(multiply) { |x| x * 2 }).to eql([6, 3, 21])
    end
    it 'returns an error if something else is given instead of an array' do
      expect { 1.my_map }.to raise_error(NoMethodError)
    end
  end

  describe '#my_inject' do
    it 'performs operation on each element of array if block is given with no proc and returns the array' do
      expect(arr.my_inject { |x| x * 2 }).to eql(arr.inject { |x| x * 2 })
    end
    it 'performs the operation on all elements of array if a symbol given as a argument' do
      expect(arr.my_inject(:+)).to eql(10)
    end
    it 'if an initial value is given, the operation starts with it' do
      expect(arr.my_inject(10, :+)).to eql(20)
    end
    it 'returns an error if something else is given instead of an array' do
      expect { 1.my_inject }.to raise_error(NoMethodError)
    end
  end

  describe '#multiply_els' do
    it 'it takes an array and returns the multiplication of all the items' do
      expect(multiply_els(arr)).to eql(14)
    end
    it 'if no argument is passed, it gives an error' do
      expect { multiply_els }.to raise_error(ArgumentError)
    end
  end
end
