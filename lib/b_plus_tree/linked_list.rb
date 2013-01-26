class BPlusTree::LinkedList
  attr_reader :first
  attr_reader :last
  attr_reader :length

  def initialize
    @dummy  = Node.new(nil, nil)
    @first  = @dummy
    @last   = @dummy
    @length = 0
  end

  def insert(key, value)
    return nil unless key.is_a?(Integer)
    node = Node.new(key, value)

    pointer = @dummy
    while pointer.next
      break if pointer.next.key > key
      pointer = pointer.next
    end

    node.next(pointer.next)
    pointer.next(node)
    @first = node if pointer == @dummy
    @last  = node if pointer == @last
    inclement_length
  end

  private

  def inclement_length
    @length = @length + 1
  end

  def decrement_length
    @length = @length - 1
  end

  class Node
    attr_reader   :key
    attr_accessor :value

    def initialize(key, value)
      @next_node = nil
      @key       = key
      @value     = value
    end

    def next(node = nil)
      if node.nil?
        @next_node
      else
        @next_node = node
      end
    end
  end
end
