class BPlusTree::Internal < BPlusTree::Page
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
      key = node.next.key
      child = node.next.value
      array.push(key)
      array.push(child.keys)
    end
    array
  end
end
