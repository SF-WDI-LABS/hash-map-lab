# lib/singly_linked_list.rb

require_relative './node.rb'

class SinglyLinkedList
  attr_reader :head

  def initialize(head=nil)
    if head.instance_of? Node
      @head = head
    elsif head.nil?
      @head = nil
    else
      @head = Node.new(head)
    end
  end

  def head=(new_head)
    if new_head.instance_of?(Node)
      @head = new_head
    elsif new_head.nil?
      @head = nil
    else
      raise ArgumentError, 'head must be a Node or nil'
    end
  end

  def inspect
    if self.empty?
      return "nil (head)"
    end
    arr = ["#{@head.data} (head)"]
    current_node = @head.next
    until current_node.nil? do
      arr << "#{current_node.data}"
      current_node = current_node.next
    end
    arr << "nil"
    arr.join(' -> ')
  end

  def empty?
    @head.nil?
  end

  def length
    count = 0
    current_node = @head
    until current_node.nil? do
      count += 1
      current_node = current_node.next
    end
    count
  end

  def append node_or_data
    new_node = nodify(node_or_data)
    current_node = @head
    if current_node.nil?
      @head = new_node
      return
    end
    until current_node.next.nil? do
      current_node = current_node.next
    end
    current_node.next = new_node
  end

  # alias of append
  def insert_at_end node_or_data
    self.append node_or_data
  end

  def insert_at_start node_or_data
    new_node = nodify(node_or_data)
    new_node.next = @head
    @head = new_node
  end

  def data_exists? data
    current_node = @head
    until current_node.nil? do
      return true if current_node.data == data
      current_node = current_node.next
    end
    false
  end

  def node_exists? node
    current_node = @head
    until current_node.nil? do
      return true if current_node == node
      current_node = current_node.next
    end
    false
  end

  def delete node
    return if self.empty?
    if @head == node
      @head = @head.next
      return
    end
    previous_node = @head
    current_node = @head.next
    until current_node.nil? do
      if current_node == node
        previous_node.next = current_node.next
        return
      end
      previous_node = current_node
      current_node = current_node.next
    end
  end

  def delete_with_data data
    return if self.empty?
    if @head.data == data
      @head = @head.next
      return
    end
    previous_node = @head
    current_node = @head.next
    until current_node.nil? do
      if current_node.data == data
        previous_node.next = current_node.next
        return
      end
      previous_node = current_node
      current_node = current_node.next
    end
  end

  def remove_from_end
    return if @head.nil?
    if @head.next.nil?
      @head = nil
      return
    end
    previous_node = @head
    current_node = @head.next
    until current_node.next.nil? do
      previous_node = current_node
      current_node = current_node.next
    end
    previous_node.next = nil
  end

  def remove_from_start
    return if self.empty?
    if @head.next.nil?
      @head = nil
      return
    end
    @head = @head.next
  end

  def middle_node
    return nil if self.empty?
    # return @head if @head.next.nil?
    current_node_1 = @head
    current_node_2 = @head
    until current_node_2.next.nil? || current_node_2.next.next.nil?
      current_node_1 = current_node_1.next
      current_node_2 = current_node_2.next.next
    end
    current_node_1
  end

  private
  def nodify node_or_data
    node_or_data.instance_of?(Node) ? node_or_data : Node.new(node_or_data)
  end
end
