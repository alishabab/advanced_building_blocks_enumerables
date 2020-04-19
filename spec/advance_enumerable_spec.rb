require_relative '../advace_enumerable.rb'
RSpec.describe Enumerable do
  let(:num_arr) { [2, 1, 7] }
  let(:num_range) { (1..3) }
  let(:nil_arr) { [false, nil, false] }
  let(:str_arr) { %w[abcd aefgh aijkl] }
  let(:multiply) do
    proc do |x|
      x * 3
    end
  end
  describe '#my_each' do
    it 'performs operation on each element of array if block is given' do
      expect(num_arr.my_each { |x| puts x }).to eql(num_arr.each { |x| puts x })
    end
    it 'performs operation on each element of range if block is given' do
      expect(num_range.my_each { |x| puts x }).to eql(num_range.each { |x| puts x })
    end
    it 'returns to_enum if no block is given' do
      expect(num_arr.my_each).to be_a(Enumerator)
    end
    it 'returns an error if an argument is given' do
      expect { num_arr.my_each(1) }.to raise_error(ArgumentError)
    end
    it 'returns an error if invoked on object other than enumerable' do
      expect { 1.my_each }.to raise_error(NoMethodError)
    end
  end

  describe '#my_each_with_index' do
    it 'performs operation on each element of array if block is given' do
      expect(num_arr.my_each_with_index { |x, n| puts x, n }).to eql(num_arr.each_with_index { |x, n| puts x, n })
    end
    it 'performs operation on each element of range if block is given' do
      expect(num_range.my_each_with_index { |x, n| puts x, n }).to eql(num_range.each_with_index { |x, n| puts x, n })
    end
    it 'returns to_enum if no block is given' do
      expect(num_arr.my_each_with_index).to be_a(Enumerator)
    end
    it 'returns an error if an argument is given' do
      expect { num_arr.my_each_with_index(1) }.to raise_error(ArgumentError)
    end
    it 'returns an error if invoked on object other than enumerable' do
      expect { 1.my_each_with_index }.to raise_error(NoMethodError)
    end
  end

  describe '#my_select' do
    it 'returns an array of items with satisfies condition' do
      expect(num_arr.my_select { |x| x < 4 }).to eql(num_arr.select { |x| x < 4 })
    end

    it 'returns an array of items with satisfies condition if invoked on range' do
      expect(num_range.my_select { |x| x < 4 }).to eql([1, 2, 3])
    end
    it 'returns to_enum if no block is given' do
      expect(num_arr.my_select).to be_a(Enumerator)
    end
    it 'returns an error if an argument is given' do
      expect { num_arr.my_select(1) }.to raise_error(ArgumentError)
    end
    it 'returns an error if invoked on object other than enumerable' do
      expect { 1.my_select }.to raise_error(NoMethodError)
    end
  end

  describe '#my_all?' do
    it 'returns true if all the items of array satisfies the condition' do
      expect(num_arr.my_all? { |x| x < 1 }).to eql(num_arr.all? { |x| x < 1 })
    end
    it 'returns true if all the items of range satisfies the condition' do
      expect(num_range.my_all? { |x| x < 4 }).to be true
    end
    it 'returns true if pattern is matched or array has all elements same as argument' do
      expect(str_arr.my_all?(/a/)).to be true
    end
    it 'returns true if all the elements are true if we dont pass block and argument' do
      expect(num_arr.my_all?).to be true
    end
    it 'returns true if an empty array is given' do
      expect([].my_all?).to be true
    end
    it 'returns false if all the items of array does not satisfies the condition' do
      expect(num_range.my_all? { |x| x < 0 }).to be false
    end
    it 'returns an error if invoked on object other than enumerable' do
      expect { 1.my_all? }.to raise_error(NoMethodError)
    end
  end

  describe '#my_none?' do
    it 'returns true if none of the items of array satisfies the condition' do
      expect(num_arr.my_none? { |x| x < 1 }).to eql(num_arr.none? { |x| x < 1 })
    end
    it 'returns true if none of the items of range satisfies the condition' do
      expect(num_range.my_none? { |x| x < 0 }).to be true
    end
    it 'returns true if none of the items match the pattern passed as argument' do
      expect(num_arr.my_none?(/z/)).to be true
    end
    it 'returns true if none of the elements are true if we dont pass block and argument' do
      expect(nil_arr.my_none?).to be true
    end
    it 'returns true if an empty array is given' do
      expect([].my_none?).to be true
    end
    it 'returns flase if any of the items of array satisfies the condition' do
      expect(num_arr.my_none? { |x| x < 4 }).to be false
    end
    it 'returns an error if invoked on object other than enumerable' do
      expect { 1.my_none? }.to raise_error(NoMethodError)
    end
  end

  describe '#my_any?' do
    it 'returns true if any of the items of array satisfies the condition' do
      expect(num_arr.my_any? { |x| x < 1 }).to eql(num_arr.any? { |x| x < 1 })
    end
    it 'returns true if any of the items of range satisfies the condition' do
      expect(num_range.my_any? { |x| x < 2 }).to be true
    end
    it 'returns true if any of the items match the pattern passed as argument' do
      expect(str_arr.my_any?(/d/)).to be true
    end
    it 'returns true if any of the elements are true if we dont pass block and argument' do
      expect(num_arr.my_any?).to be true
    end
    it 'returns false if none of the items of range satisfies the condition' do
      expect(num_range.my_any? { |x| x < 0 }).to be false
    end
    it 'returns flase if an empty array is given' do
      expect([].my_any?).to be false
    end
    it 'returns an error if invoked on object other than enumerable' do
      expect { 1.my_any? }.to raise_error(NoMethodError)
    end
  end

  describe '#my_count' do
    it 'counts the items of an array if no block is passed' do
      expect(num_arr.my_count).to eql(num_arr.count)
    end
    it 'counts the items of an array which satisfies the condition if block is passed' do
      expect(num_arr.my_count { |x| x < 3 }).to eql(2)
    end
    it 'counts the items of a range' do
      expect(num_range.my_count).to eql(3)
    end
    it 'returns the amount of times an item is in an array if an argument is passed' do
      expect(num_arr.my_count(2)).to eql(1)
    end
    it 'returns the amount of times a condition is satisfied by each element of array' do
      expect(num_arr.my_count(&:even?)).to be 1
    end
    it 'returns an error if invoked on object other than enumerable' do
      expect { 1.my_all? }.to raise_error(NoMethodError)
    end
  end

  describe '#my_map' do
    it 'performs operation on each element of array if block is given with no proc and returns the array' do
      expect(num_arr.my_map { |x| x * 2 }).to eql(num_arr.map { |x| x * 2 })
    end
    it 'performs operation on each element of range if block is given and returns the array' do
      expect(num_range.my_map { |x| x * 2 }).to eql([2, 4, 6])
    end
    it 'returns to_enum if no block is given' do
      expect(num_arr.my_map).to be_a(Enumerator)
    end
    it 'performs the proc operation if block and proc are given' do
      expect(num_arr.my_map(multiply) { |x| x * 2 }).to eql([6, 3, 21])
    end
    it 'returns an error if invoked on object other than enumerable' do
      expect { 1.my_map }.to raise_error(NoMethodError)
    end
  end

  describe '#my_inject' do
    it 'performs operation on each element of array if block is given with no proc and returns the result' do
      expect(num_arr.my_inject { |x| x * 2 }).to eql(num_arr.inject { |x| x * 2 })
    end
    it 'performs operation on each element of range if block is given and returns the result' do
      expect(num_range.my_inject { |x| x + 2 }).to eql(5)
    end
    it 'performs the operation on all elements of array if a symbol given as a argument' do
      expect(num_arr.my_inject(:+)).to eql(10)
    end
    it 'if an initial value is given, the operation starts with it' do
      expect(num_arr.my_inject(10, :+)).to eql(20)
    end
    it 'returns an error if invoked on object other than enumerable' do
      expect { 1.my_inject }.to raise_error(NoMethodError)
    end
  end

  describe '#multiply_els' do
    it 'it takes an array and returns the multiplication of all the items' do
      expect(multiply_els(num_arr)).to eql(14)
    end
    it 'if no argument is passed, it gives an error' do
      expect { multiply_els }.to raise_error(ArgumentError)
    end
  end
end
