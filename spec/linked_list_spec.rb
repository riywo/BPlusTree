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
    @list.keys.should == [1]
  end

  it 'should insert two nodes' do
    @list.insert(1, 'one').should == 1
    @list.insert(2, 'two').should == 2
    @list.first.key.should   == 1
    @list.last.key.should    == 2
    @list.keys.should == [1, 2]
  end

  it 'should insert three nodes' do
    @list.insert(1, 'one').should   == 1
    @list.insert(2, 'two').should   == 2
    @list.insert(3, 'three').should == 3
    @list.first.key.should   == 1
    @list.last.key.should    == 3
    @list.keys.should == [1, 2, 3]
  end

  it 'should insert three nodes sorted' do
    @list.insert(2, 'two').should   == 1
    @list.insert(1, 'one').should   == 2
    @list.insert(3, 'three').should == 3
    @list.first.key.should   == 1
    @list.last.key.should    == 3
    @list.keys.should == [1, 2, 3]
  end

  it 'should insert five nodes sorted' do
    @list.insert(2, 'two').should   == 1
    @list.insert(1, 'one').should   == 2
    @list.insert(5, 'three').should == 3
    @list.insert(3, 'three').should == 4
    @list.insert(4, 'three').should == 5
    @list.keys.should == [1, 2, 3, 4, 5]
  end

  it 'should fail with non-integer key insertion' do
    @list.insert('a', 'fail').should  == nil
  end

  it 'should fail with exist key insertion' do
    @list.insert(1, 'one').should   == 1
    @list.insert(1, 'one').should   == nil
  end

  it 'should search exist nodes' do
    @list.insert(2, 'two').should   == 1
    @list.insert(1, 'one').should   == 2
    @list.insert(3, 'three').should == 3

    @list.search(1).key.should == 1
    @list.search(2).key.should == 2
    @list.search(3).key.should == 3
    @list.search(4).should == nil
  end

  it 'should delete first node' do
    @list.insert(2, 'two').should   == 1
    @list.insert(1, 'one').should   == 2
    @list.insert(3, 'three').should == 3

    @list.delete(1).should == true
    @list.length.should == 2
    @list.first.key.should == 2
    @list.last.key.should  == 3
    @list.keys.should == [2, 3]
  end

  it 'should delete last node' do
    @list.insert(2, 'two').should   == 1
    @list.insert(1, 'one').should   == 2
    @list.insert(3, 'three').should == 3

    @list.delete(3).should == true
    @list.length.should == 2
    @list.first.key.should == 1
    @list.last.key.should  == 2
    @list.keys.should == [1, 2]
  end

  it 'should search lte nodes' do
    @list.insert(1, 'one').should   == 1
    @list.insert(3, 'three').should == 2
    @list.insert(5, 'five').should  == 3

    @list.search_lte(1).key.should == 1
    @list.search_lte(2).key.should == 1
    @list.search_lte(3).key.should == 3
    @list.search_lte(4).key.should == 3
    @list.search_lte(5).key.should == 5
    @list.search_lte(6).key.should == 5
  end
end
