class BPlusTree::LinkedList
  attr_reader :first
  attr_reader :last

  def initialize
    @first = Node.new(nil, nil)
    @last  = @first
  end

  def insert(key, value)
    node = Node.new(key, value)

    if @first.key.nil?
      @first = node
      @last  = node
    else
      @last.next(node)
      @last = node
    end
    true
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
