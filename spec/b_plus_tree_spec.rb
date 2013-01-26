describe BPlusTree do
  it 'should return correct version string' do
    BPlusTree.version_string.should == "BPlusTree version #{BPlusTree::VERSION}"
  end
end
