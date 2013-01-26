describe BPlusTree::LinkedList do
  before do
    @list = BPlusTree::LinkedList.new
  end

  it 'should insert one node' do
    @list.insert(1, 'one').should == 1
    @list.first.key.should   == 1
    @list.first.value.should == 'one'
    @list.last.key.should    == 1
    @list.last.value.should  == 'one'
  end

  it 'should insert two nodes' do
    @list.insert(1, 'one').should == 1
    @list.insert(2, 'two').should == 2
    @list.first.key.should   == 1
    @list.first.value.should == 'one'
    @list.last.key.should    == 2
    @list.last.value.should  == 'two'
  end

  it 'should insert three nodes' do
    @list.insert(1, 'one').should   == 1
    @list.insert(2, 'two').should   == 2
    @list.insert(3, 'three').should == 3
    @list.first.key.should   == 1
    @list.first.value.should == 'one'
    @list.last.key.should    == 3
    @list.last.value.should  == 'three'
  end
end
