describe BPlusTree::Page do
  before do
    @page = BPlusTree::Page.new(100)
  end

  it 'should insert one record' do
    @page.insert(1, 'one').should == 1
    @page.infimum.key.should  == 1
    @page.supremum.key.should == 1
    @page.keys.should == [1]
  end

  it 'should insert two record' do
    @page.insert(1, 'one').should == 1
    @page.insert(2, 'two').should == 2
    @page.infimum.key.should  == 1
    @page.supremum.key.should == 2
    @page.keys.should == [1, 2]
  end

  it 'should insert three record' do
    @page.insert(1, 'one').should   == 1
    @page.insert(2, 'two').should   == 2
    @page.insert(3, 'three').should == 3
    @page.infimum.key.should  == 1
    @page.supremum.key.should == 3
    @page.keys.should == [1, 2, 3]
  end

  it 'should delete first node' do
    @page.insert(2, 'two').should   == 1
    @page.insert(1, 'one').should   == 2
    @page.insert(3, 'three').should == 3

    @page.delete(1).should == true
    @page.length.should == 2
    @page.infimum.key.should == 2
    @page.supremum.key.should  == 3
    @page.keys.should == [2, 3]
  end
end
