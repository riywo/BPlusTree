describe BPlusTree::Tree do
  before do
    @tree = BPlusTree::Tree.new(3)
  end

  it 'should insert one record' do
    @tree.insert(1, 'one').should == true
    @tree.keys.should == [0,[1]]
  end

  it 'should fail with exist key insertion' do
    @tree.insert(1, 'one').should   == true
    @tree.insert(1, 'one').should   == nil
    @tree.keys.should == [0,[1]]
  end

  it 'should insert five records' do
    @tree.insert(1, 'one').should == true
    @tree.keys.should == [0,[1]]
    @tree.insert(2, 'two').should == true
    @tree.keys.should == [0,[1,2]]
    @tree.insert(3, 'three').should == true
    @tree.keys.should == [0,[1,2,3]]
    @tree.insert(4, 'four').should == true
    @tree.keys.should == [0,[1,2],3,[3,4]]
    @tree.insert(5, 'five').should == true
    @tree.keys.should == [0,[1,2],3,[3,4,5]]
  end

  it 'should split root page' do
    @tree.insert(1,1).should == true
    @tree.insert(2,1).should == true
    @tree.insert(3,1).should == true
    @tree.insert(4,1).should == true
    @tree.insert(5,1).should == true
    @tree.insert(6,1).should == true
    @tree.keys.should == [0,[1,2],3,[3,4],5,[5,6]]
    @tree.insert(7,1).should == true
    @tree.keys.should == [0,[1,2],3,[3,4],5,[5,6,7]]
    @tree.insert(8,1).should == true
    @tree.keys.should == [0,[0,[1,2],3,[3,4]],5,[5,[5,6],7,[7,8]]]
  end
end
