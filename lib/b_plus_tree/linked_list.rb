class BPlusTree::LinkedList
  attr_reader :first
  attr_reader :last
  attr_reader :length

  def initialize
    @first  = Node.new(nil, nil)
    @last   = @first
    @length = 0
  end

  def insert(key, value)
    node = Node.new(key, value)
    push(node)
  end

  private

  def inclement_length
    @length = @length + 1
  end

  def decrement_length
    @length = @length - 1
  end

  def unshift(node)
    if @first.key.nil?
      @first = node
      @last  = node
    else
      node.next(@first)
      @first = node
    end
    inclement_length
  end

  def push(node)
    if @first.key.nil?
      @first = node
      @last  = node
    else
      @last.next(node)
      @last = node
    end
    inclement_length
  end

  def shift

  end

  def pop

  end

  class Node
    attr_reader   :key
    attr_accessor :value

    def initialize(key, value)
      @next_node = nil
      @key       = key
      @value     = value
    end

    def next(node)
      @next_node = node
    end
  end
end
