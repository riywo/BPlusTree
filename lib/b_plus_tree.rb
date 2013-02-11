module BPlusTree
  def self.version_string
    "BPlusTree version #{VERSION}"
  end
end

require "b_plus_tree/version"
require "b_plus_tree/linked_list"
require "b_plus_tree/tree"
require "b_plus_tree/page"
require "b_plus_tree/page/internal"
require "b_plus_tree/page/leaf"
