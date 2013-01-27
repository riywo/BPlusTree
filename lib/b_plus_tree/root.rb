class BPlusTree::Root < BPlusTree::Page
  def initialize(size)
    super(size)
    leaf = BPlusTree::Leaf.new(size)
    insert(0, leaf)
  end

  def search_leaf(key, path = [self])
    child = @list.search_lte(key).value

    if child.class == BPlusTree::Leaf
      return child, path
    else # child == internal
      return child.search_leaf(key, path)
    end
  end

  def keys
    array = []
    @list.each do |node|
      child = node.next.value
      array.push(child.keys)
    end
    array
  end

  def can_insert?(key, value)
    true
  end
end
