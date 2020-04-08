# rubocop: disable Metrics/ModuleLength
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
      my_each { |x| res = false unless arg[0] === x } # rubocop:disable Style/CaseEquality
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
      my_each { |x| res = true if arg[0] === x } # rubocop:disable Style/CaseEquality
    elsif !block_given?
      my_each { |x| res = true if x }
    else
      my_each { |x| res = true if yield(x) }
    end
    res
  end

  # my_none?

  def my_none?(*arg)
    res = true
    if !arg[0].nil?
      my_each { |x| res = false if arg[0] === x } # rubocop:disable Style/CaseEquality
    elsif !block_given?
      my_each { |x| res = false if x }
    else
      my_each { |x| res = false if yield(x) }
    end
    res
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
    return to_enum(:my_map) unless block_given?

    my_arr = []
    if proc.nil?
      my_each { |x| my_arr.push(yield(x)) }
    else
      my_each { |x| my_arr.push(proc.call(x)) }
    end
    my_arr
  end

  # my_inject
  def my_inject(*arg) # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
    arr = is_a?(Array) ? self : to_a
    res = arg[0] if arg[0].is_a? Integer

    if arg[0].is_a?(Symbol) || arg[0].is_a?(String)
      sym = arg[0]
    elsif arg[0].is_a?(Integer)
      sym = arg[1] if arg[1].is_a?(Symbol) || arg[1].is_a?(String)
    end

    if sym
      arr.my_each { |x| res = res ? res.send(sym, x) : x }
    else
      arr.my_each { |x| res = res ? yield(res, x) : x }
    end

    res
  end
end
# rubocop: enable Metrics/ModuleLength

def multiply_els(arr)
  arr.my_inject(1) { |mul, e| mul * e }
end
