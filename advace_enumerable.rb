module Enumerable
  #  my_each
  def my_each
    i = 0
    while i < size
      yield(self[i])
      i += 1
    end
    self
  end
  # my_each_with_index

  def my_each_with_index
    i = 0
    while i < size
      yield(self[i], i)
      i += 1
    end
    self
  end
end
[1, 2, 2, 4, 6].my_each { |x| puts x }
[1, 2, 3, 4, 5].my_each_with_index { |e, i| puts "element:#{e}, index:#{i}" }
