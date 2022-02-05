module Enumerable
  # Your code goes here
  def my_each_with_index
    arr_length = self.length
    arr_length.times { |index| yield self[index], index }

    self
  end

  def my_select
    result = []
    self.length.times { |index| result << self[index] if yield(self[index]) }
    
    result
  end

  def my_all?
    self.length.times { |index| return false unless yield(self[index]) }
    
    true
  end

  def my_any?
    self.length.times { |index| return true if yield(self[index]) }
    
    false
  end

  def my_none?
    self.length.times { |index| return false if yield(self[index]) }

    true
  end

  def my_count
    if block_given?
      count = 0
      
      self.length.times { |index| count += 1 if yield(self[index]) }

      count
    else
      self.length
    end
  end

  def my_map
    result = []

    self.length.times { |index| result << yield(self[index]) }

    result
  end

  def my_inject(init_value)

    self.length.times do |index|
      init_value = yield(init_value, self[index])
    end
    
    init_value
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    arr_length = self.length
    arr_length.times { |index| yield self[index] }

    self
  end
end
