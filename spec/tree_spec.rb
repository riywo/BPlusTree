describe BPlusTree::Tree do
  before do
    @tree = BPlusTree::Tree.new
  end

  it 'should insert one record' do
    @tree.insert(1, 'one').should == true
    @tree.keys.should == [[1]]
  end

  it 'should fail with exist key insertion' do
    @tree.insert(1, 'one').should   == true
    @tree.insert(1, 'one').should   == nil
    @tree.keys.should == [[1]]
  end

  it 'should insert five records' do
    @tree.insert(1, 'one').should == true
    @tree.keys.should == [[1]]
    @tree.insert(2, 'two').should == true
    @tree.keys.should == [[1,2]]
    @tree.insert(3, 'three').should == true
    @tree.keys.should == [[1,2,3]]
    @tree.insert(4, 'four').should == true
    @tree.keys.should == [[1,2],[3,4]]
    @tree.insert(5, 'five').should == true
    @tree.keys.should == [[1,2],[3,4,5]]
  end

end
