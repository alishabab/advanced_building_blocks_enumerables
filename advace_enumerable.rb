module Enumerable
  #  my_each
  def my_each
    return to_enum(:my_each) unless block_given?

    i = 0
    while i < size
      yield(self[i])
      i += 1
    end
    self
  end
  # my_each_with_index

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    i = 0
    while i < size
      yield(self[i], i)
      i += 1
    end
    self
  end
  # my_select

  def my_select
    return to_enum(:my_select) unless block_given?

    i = 0
    my_arr = []
    while i < size
      my_arr.push(self[i]) if yield(self[i])
      i += 1
    end
    my_arr
  end
  # my_all?

  def my_all?(*arg)
    res = true
    if !arg[0].nil?
      my_each { |x| res = false unless arg[0] == x }
    elsif !block_given?
      my_each { |x| res = false unless x }
    else
      my_each { |x| res = false unless yield(x) }
    end
    res
  end

  # my_any?
  def my_any?(*arg)
    res = false
    if !arg[0].nil?
      my_each { |x| res = true if arg[0] == x }
    elsif !block_given?
      my_each { |x| res = true if x }
    else
      my_each { |x| res = true if yield(x) }
    end
    res
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

  def my_map(proc = nil)
    my_arr = []
    if proc.nil?
      my_each { |x| my_arr.push(yield(x)) }
    else
      my_each { |x| my_arr.push(proc.call(x)) }
    end
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

def multiply_els(arr)
  arr.my_inject(1) { |mul, e| mul * e }
end
