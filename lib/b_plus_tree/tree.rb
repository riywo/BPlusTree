class BPlusTree::Tree
  def initialize
    @root = BPlusTree::Root.new
  end

  def insert(key, value)
    leaf, path = @root.search_leaf(key) # path = [(internal1, internal2, ...) root]
    result = nil
    if leaf.can_insert?(key, value)
      result = leaf.insert(key, value)
    else
      pivot, new_leaf = split_page(key, leaf, path)
      if key < pivot
        result = leaf.insert(key, value)
      else
        result = new_leaf.insert(key, value)
      end
    end
    return true unless result.nil?
    nil
  end

  def keys
    @root.keys
  end

  private

  def split_page(key, page, path)
    pivot, new_page = page.split(key)
    parent = path.shift

    if parent.can_insert?(pivot, new_page)
      parent.insert(pivot, new_page)
    else
      p_pivot, p_new_page = split_page(pivot, parent, path)
      if pivot < p_pivot
        parent.insert(pivot, new_page)
      else
        p_new_page.insert(pivot, new_page)
      end
    end

    return pivot, new_page
  end
end
