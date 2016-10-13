# lib/node.rb

class Node
  def initialize(data)
    @data = !data.nil? ? data : raise(ArgumentError, 'Node data cannot be nil')
    @next = nil
  end

  attr_reader :data, :next
  def data=(new_data)
    if !new_data.nil?
      @data = new_data
    else
      raise ArgumentError, 'Node data cannot be nil'
    end
  end
  def next=(new_next)
    if new_next.is_a? Node
      @next = new_next
    elsif new_next.nil?
      @next = new_next
    else
      raise ArgumentError, 'next must be a Node or nil'
    end
  end

end
