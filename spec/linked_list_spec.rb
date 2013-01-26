describe BPlusTree::LinkedList do
  before do
    @list = BPlusTree::LinkedList.new
  end

  it 'should insert one node' do
    @list.insert(1, 'one').should == true
  end
end
