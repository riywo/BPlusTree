describe BPlusTree::Tree do
  before do
    @tree = BPlusTree::Tree.new
  end

  it 'should insert one record' do
    @tree.insert(1, 'one').should == 1
#    @tree.keys.should == [1]
  end
end
