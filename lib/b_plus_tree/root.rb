class BPlusTree::Root < BPlusTree::Page
  def initialize
    super
    leaf = BPlusTree::Leaf.new
    insert(0, leaf)
  end

  def search_leaf(key)
  end
end
