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
end

[1, 2, 2, 4, 6].my_each { |x| puts x }
