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
  # my_all?

  def my_all?
    i = 0
    while i < size
      return false unless yield(self[i])

      i += 1
    end
    true
  end

  # my_any?
  def my_any?
    i = 0
    while i < size
      return true if yield(self[i])

      i += 1
    end
    false
  end

  # my_none?

  def my_none?
    i = 0
    while i < size
      return false if yield(self[i])

      i += 1
    end
    true
  end
end
[1, 2, 2, 4, 6].my_each { |x| puts x }
[1, 2, 3, 4, 5].my_each_with_index { |e, i| puts "element:#{e}, index:#{i}" }
my_select_res = [10, 20, 9, 8, 30, 40].my_select { |x| x > 10 }
puts my_select_res
my_all_res = [10, 20, 30, 8, 30, 40].my_all? { |x| x > 10 }
puts my_all_res
my_any_res = [1, 2, 3, 8, 3, 4].my_any? { |x| x > 10 }
puts my_any_res
my_none_res = [1, 2, 3, 3, 4].my_none? { |x| x > 5 }
puts my_none_res
