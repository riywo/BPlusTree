class BPlusTree::Page
  attr_accessor :prev
  attr_accessor :next
  attr_accessor :list
  attr_reader   :max_size

  def initialize(size)
    @prev = nil
    @next = nil
    @list = BPlusTree::LinkedList.new
    @max_size = size
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

  def search(key)
    @list.search(key)
  end

  def can_insert?(key, value)
    if length + 1 > max_size
      nil
    else
      true
    end
  end

  def split(key)
    left, pivot, right = @list.split(key)
    new_page = self.class.new(@max_size)
    new_page.list = right
    new_page.prev = self
    new_page.next = @next
    @next = new_page
    return pivot, new_page
  end
end
