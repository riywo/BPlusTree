class BPlusTree::Page
  attr_accessor :prev
  attr_accessor :next
  attr_reader   :list

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

  def length
    @list.length
  end

  def insert(key, value)
    @list.insert(key, value)
  end

  def delete(key)
    @list.delete(key)
  end
end
