describe BPlusTree::Page do
  before do
    @page = BPlusTree::Page.new
  end

  it 'should insert one record' do
    @page.insert(1, 'one').should == true
  end
end
