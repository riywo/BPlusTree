class BPlusTree::Page
  attr_accessor :prev
  attr_accessor :next
  attr_accessor :list

  def initialize
    @prev = nil
    @next = nil
    @list = BPlusTree::LinkedList.new
  end

  def infimum
    @list.first
  end

  def supremum
    @list.last
  end

  def keys
    @list.keys
  end

  def insert(key, value)
    @list.insert(key, value)
  end
end
