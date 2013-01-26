class BPlusTree::Tree
  def initialize
    @root = BPlusTree::Root.new
  end

  def insert(key, value)
    leaf = @root.search_leaf(key)
#    leaf.insert(key, value)
    1
  end
end
