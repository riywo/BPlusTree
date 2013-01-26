describe BPlusTree::Page do
  before do
    @page = BPlusTree::Page.new
  end

  it 'should insert one record' do
    @page.insert(1, 'one').should == 1
    @page.infimum.key.should  == 1
    @page.supremum.key.should == 1
    @page.keys.should == [1]
  end
end
