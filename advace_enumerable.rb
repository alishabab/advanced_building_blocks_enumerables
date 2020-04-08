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
  # my_count

  def my_count(variable = nil)
    i = 0
    count = 0
    if block_given?
      while i < size
        count += 1 if yield(self[i])
        i += 1
      end
    elsif variable.nil?
      my_each { count += 1 }
    else
      my_each do |x|
        count += 1 if x == variable
      end
    end
    count
  end

  # my_map

  def my_map
    return unless block_given?

    my_arr = []
    my_each { |x| my_arr.push(yield(x)) }
    my_arr
  end

  # my_inject
  def my_inject(start = 0)
    i = 0
    acc = start
    while i < size
      acc = yield(acc, self[i])
      i += 1
    end
    acc
  end
end
# [1, 2, 2, 4, 6].my_each { |x| puts x }
# [1, 2, 3, 4, 5].my_each_with_index { |e, i| puts "element:#{e}, index:#{i}" }
# my_select_res = [10, 20, 9, 8, 30, 40].my_select { |x| x > 10 }
# puts my_select_res
# my_all_res = [10, 20, 30, 8, 30, 40].my_all? { |x| x > 10 }
# puts my_all_res
# my_any_res = [1, 2, 3, 8, 3, 4].my_any? { |x| x > 10 }
# puts my_any_res
# my_none_res = [1, 2, 3, 3, 4].my_none? { |x| x > 5 }
# puts my_none_res
# my_count_res = [1, 2, 3, 4, 5].my_count
# puts my_count_res
# my_count_param = [1, 2, 2, 3, 4, 5].my_count(2)
# puts my_count_param
# my_count_block = [1, 2, 2, 3, 4, 5].my_count { |x| (x % 2).zero? }
# puts my_count_block
