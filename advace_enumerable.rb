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
  # my_select

  def my_select
    i = 0
    my_arr = []
    while i < size
      my_arr.push(self[i]) if yield(self[i])
      i += 1
    end
    my_arr
  end
end
[1, 2, 2, 4, 6].my_each { |x| puts x }
[1, 2, 3, 4, 5].my_each_with_index { |e, i| puts "element:#{e}, index:#{i}" }
res = [10, 20, 9, 8, 30, 40].my_select { |x| x > 10 }
puts res
