class BPlusTree::LinkedList
  attr_reader :last
  attr_reader :length

  def initialize
    @dummy  = Node.new(nil, nil)
    @first  = @dummy.next
    @last   = @dummy
    @length = 0
  end

  def first
    @dummy.next
  end

  def keys
    array = []
    pointer = @dummy
    while pointer.next
      array.push(pointer.next.key)
      pointer = pointer.next
    end
    array
  end

  def insert(key, value)
    return nil unless key.is_a?(Integer)
    node = Node.new(key, value)

    pointer = @dummy
    while pointer.next
      break if pointer.next.key > key
      pointer = pointer.next
    end

    node.next = pointer.next
    pointer.next = node
    @last = node if pointer == @last
    inclement_length
  end

  def search(key)
    return nil unless key.is_a?(Integer)

    pointer = @dummy
    while pointer.next
      return pointer.next if pointer.next.key == key
      pointer = pointer.next
    end
    nil
  end

  def delete(key)
    return nil unless key.is_a?(Integer)

    pointer = @dummy
    is_deleted = nil
    while pointer.next
      if pointer.next.key == key
        is_deleted = true
        @last = pointer if pointer.next == @last
        decrement_length
        pointer.next = pointer.next.next
      else
        pointer = pointer.next
      end
    end
    is_deleted
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
    attr_accessor :next

    def initialize(key, value)
      @next      = nil
      @key       = key
      @value     = value
    end
  end
end
