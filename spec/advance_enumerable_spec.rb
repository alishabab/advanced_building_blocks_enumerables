require '../advace_enumerable.rb'
RSpec.describe Enumerable do
  include Enumerable
  let(:arr) { [2, 1, 7] }
  describe '#my_each' do
    it 'performs operation on each element of array if block is given' do
      expect(arr.my_each { |x| puts x }).to eql(arr.each { |x| puts x })
    end
  end
end
