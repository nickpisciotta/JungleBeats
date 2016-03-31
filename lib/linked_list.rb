require "./lib/node"  # ~> LoadError: cannot load such file -- ./lib/node

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def append(data)
    # Check if head exists
    if head.nil?
      # If the head does not exist, set head equal to first node_data
      @head = Node.new(data)
    else
      # If head exists, set a variable 'current_node' to be equal to head
      current_node = @head
      # while the current node's next_node is not nil
      while current_node.next_node != nil
      # set current_node equal to the next node in the line
        current_node = current_node.next_node
      end
      # Once you find a node whose next_node IS nil
      # append the new node onto that point
      current_node.next_node = Node.new(data)
    end
  end

  def prepend(data)
    if @head.nil?
      @head = Node.new(data)
    else
      new_head = Node.new(data)
      new_head.next_node = @head
      @head = new_head
    end
    data
  end

  def count
    current_node = @head
    node_counter = 0
    #If head exists, set a variable to current node to equal head
    if current_node != nil
      node_counter += 1
    #while the current node.next node is not nil,
      while current_node.next_node != nil
    #set the current_node to the next node, then it will check condition again
        node_counter += 1
        current_node = current_node.next_node
      end
    end
    node_counter
   end

  def insert(position, data)
    if @head.nil?
      @head = Node.new(data)
    else
      counter = 0
      current_node = @head
      until counter == position
        counter  += 1
        previous = current_node
        current_node = current_node.next_node
      end
      new_node = Node.new(data)
      previous.next_node = new_node
      new_node.next_node = current_node
    end
  end

  def find (position, element_number)
    if @head.nil?
      nil 
    else
      counter = 0
      current_node = @head
      until counter == position
        counter += 1
        current_node = current_node.next_node
      end
      str = ""
      element_number.times do
        str << current_node.data + " "
        current_node = current_node.next_node
      end
      str.chop
    end
  end

  def include?(beat)
    current_node = @head
    included = false
    while current_node.next_node != nil
      if current_node.data == beat
        included = true
        current_node = current_node.next_node
      else
        current_node = current_node.next_node
      end
    end
    if current_node.data == beat
      included = true
    end
    included
  end

  def pop
    if head.nil?
      nil
    else
      current_node = @head
      until current_node.next_node.next_node == nil
        current_node = current_node.next_node
      end
    end
    popped_node = current_node.next_node.data
    current_node.next_node = nil
    popped_node
  end

  def to_string
    current_node = @head
    if @head.nil?
      str = nil
    else
      str = ""
      while current_node != nil
      str << current_node.data + " "
      current_node = current_node.next_node
      end
      str.chop
    end
  end

end
