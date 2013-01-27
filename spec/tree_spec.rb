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

  it 'should insert two records' do
    @tree.insert(1, 'one').should == true
    @tree.insert(2, 'two').should == true
    @tree.keys.should == [[1, 2]]
  end

end
