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
    each do |pointer|
      array.push(pointer.next.key)
    end
    array
  end

  def insert(key, value)
    return nil unless key.is_a?(Integer)
    node = Node.new(key, value)

    pointer = search_lte(key)
    return nil if pointer.key == key

    node.next = pointer.next
    pointer.next = node
    @last = node if pointer == @last
    inclement_length
  end

  def search(key)
    return nil unless key.is_a?(Integer)

    pointer = search_lte(key)
    return pointer if pointer.key == key
    nil
  end

  def search_lte(key)
    return nil unless key.is_a?(Integer)

    each do |pointer|
      return pointer if pointer.next.key > key
    end
    return @last
  end

  def delete(key)
    return nil unless key.is_a?(Integer)

    each do |pointer|
      if pointer.next.key == key
        @last = pointer if pointer.next == @last
        decrement_length
        pointer.next = pointer.next.next
        return true
      elsif pointer.next.key > key
        return nil
      end
    end

    return nil
  end

  def split(key)
#    half = @length / 2
#    pointer = @dummy
#    half.times do
#      pointer = pointer.next
#    end
#    pivot = pointer.key
#    right = BPlusTree::LinkedList.new

    # temp
    right = BPlusTree::LinkedList.new
    right.insert(@last.key, @last.value)
    pivot = @last.key
    delete(pivot)
    left = self
    return left, pivot, right
  end

  def each
    pointer = @dummy
    while pointer.next
      yield(pointer)
      pointer = pointer.next
    end
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
