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

  it 'should insert three nodes sorted' do
    @list.insert(2, 'two').should   == 1
    @list.insert(1, 'one').should   == 2
    @list.insert(3, 'three').should == 3
    @list.first.key.should   == 1
    @list.first.value.should == 'one'
    @list.last.key.should    == 3
    @list.last.value.should  == 'three'
  end

  it 'should insert five nodes sorted' do
    @list.insert(2, 'two').should   == 1
    @list.insert(1, 'one').should   == 2
    @list.insert(5, 'three').should == 3
    @list.insert(3, 'three').should == 4
    @list.insert(4, 'three').should == 5

    node = @list.first
    (1..5).each do |i|
      node.key.should == i
      node = node.next
    end
  end

  it 'should fail with non-integer key insertion' do
    @list.insert('a', 'fail').should  == nil
  end
end
