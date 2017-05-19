RSpec.describe "distributions/show.html.erb", type: :view do
  context "when viewing a distribution" do
    before :each do
      item = create(:item)
      inventory = create(:inventory, :with_items, item_quantity: 5, item: item)
      @distribution = create(:distribution, :with_items, inventory: inventory, item_quantity: 5, item: item)
      assign(:distribution, @distribution)
      assign(:containers, @distribution.containers)
      render
    end

    it "DOES list the items found in the distribution, along with quantities" do
    	expect(rendered).to have_xpath("//section[@id='containers']/table/tbody/tr", count: 1)
    end
  end
end